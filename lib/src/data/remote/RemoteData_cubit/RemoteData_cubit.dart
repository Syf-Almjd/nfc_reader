import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:nfc_reader/src/config/utils/managers/app_constants.dart';
import 'package:nfc_reader/src/data/local/localData_cubit/local_data_cubit.dart';
import 'package:nfc_reader/src/domain/models/login/user_login_model.dart';
import 'package:nfc_reader/src/presentation/Shared/Components.dart';
import '../../../config/utils/styles/app_colors.dart';
import '../../../domain/models/propertySearch/PropertySearchRequest.dart';
import '../../../domain/models/propertySearch/PropertySearchResponse.dart';
import '../../../domain/models/signup/user_signup_model.dart';
import '../../../presentation/Cubits/navigation_cubit/navi_cubit.dart';
import '../error_handleing.dart';

part 'RemoteData_states.dart';

class RemoteDataCubit extends Cubit<RemoteAppStates> {
  RemoteDataCubit() : super(InitialAppState());
  Dio dio = Dio();

  static RemoteDataCubit get(context) => BlocProvider.of(context);

  String getApiUrl(String endpoint) {
    String apiUrl = '${AppConstants.baseApiUrl}$endpoint';
    return apiUrl;
  }

  void dataDelayed(context) {
    // this is for loading buttons to keep the user informed
    emit(GetDataError());
  }

  Future<Response> dioGet(queryData, String endPoint, context) async {
    String? token;

    // customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 120));

    try {
      token = (await LocalDataCubit.get(context).getSharedToken()).token;

      var headers = {
        'Content-Type': AppConstants.contentType,
        'Authorization' : 'Bearer $token'
      };
      var response = await dio.get(
        getApiUrl(endPoint),
        options: Options(headers: headers),
        queryParameters: queryData
      );

      return response;
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.data != null &&
          e.response!.data is Map) {
        if(kDebugMode){
          print(e);
        }
        var responseData = e.response!.data;
        String message = responseData['message'] ?? 'Unknown error';
        // Use the message as needed, for example, showing a toast
        showToast(message, AppColors.redColor, context);
      } else {
        if(kDebugMode){
          print(e);
        }
        var error = DioExceptionHandler.handleError(e);
        showToast(error, AppColors.redColor, context);
      }
      rethrow;
    }
  }

  Future<Response> dioPost(Map dataJson, String endPoint, bool useAuth, context) async {
    Dio dio = Dio();
    String? token;
    // customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 120));
    try {
      var headers = {
        'Content-Type': AppConstants.contentType,
      };

      // Adding authorization header if needed
      if (useAuth) {
        token = (await LocalDataCubit.get(context).getSharedToken()).token;
        headers['Authorization'] = 'Bearer $token';
      }
        var response = await dio.post(
        getApiUrl(endPoint),
          options: Options(
              contentType: AppConstants.contentType,
              headers: headers),
          data: dataJson,
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.data != null &&
          e.response!.data is Map) {
        if(kDebugMode){
          print(e);
        }
        var responseData = e.response!.data;
        String message = responseData['message'] ?? 'Unknown error';
        // Use the message as needed, for example, showing a toast
        showToast(message, AppColors.redColor, context);
      } else {
        if(kDebugMode){
          print(e);
        }
        var error = DioExceptionHandler.handleError(e);
        showToast(error, AppColors.redColor, context);
      }
      rethrow;
    }
  }

  Future<String> signupUser(SignUpModelRequest signUpModel, context) async {
    emit(GettingData());

    var response = await dioPost(
        signUpModel.toJson(), AppConstants.signUpEndpoint, false, context);
    if (response.statusCode == 200) {
      LocalDataCubit.get(context)
          .saveSharedMap(AppConstants.userApiToken, response.data);
      // getUserInfo(); TODO get user info and save locally for offline and faster usage using saveSharedMap
      NaviCubit.get(context).navigateToHome(context);
      emit(GetDataSuccessful());

      return "Thank you, Register Successful";
    } else {
      emit(GetDataError());
      return "Sorry, error occurred. Please try again!";
    }
  }

  Future<String> loginUser(LoginModelRequest loginModel, context) async {
    emit(GettingData());

    var response =
        await dioPost(loginModel.toJson(), AppConstants.loginEndpoint, false, context);
    if (response.statusCode == 200) {
      emit(GetDataSuccessful());
      LocalDataCubit.get(context)
          .saveSharedMap(AppConstants.currentUser, loginModel.toJson()); //Save user credentials
      LocalDataCubit.get(context)
          .saveSharedMap(AppConstants.userApiToken, response.data); //Save user token
      // getUserInfo(); TODO get user info and save locally for offline and faster usage using saveSharedMap
      NaviCubit.get(context).navigateToHome(context);
      emit(GetDataSuccessful());
      return "Thank you, Login Successful";
    } else {
      emit(GetDataError());
      return "Sorry, error occurred. Please try again!";
    }
  }

  Future<String> logoutUser(context) async {
    emit(GettingData());
    try {
      NaviCubit.get(context).navigateToSliderLogout(context);
      emit(GetDataSuccessful());
      return "Thank you, Logout Successful";
    } on DioException catch (e) {
      emit(GetDataError());
      return "Sorry, ${e.response!.statusMessage}";
    }
  }

  Future<List<PropertySearchResponse>> getSearchedProperty(
      PropertySearchRequest propertySearch, context) async {
    emit(GettingData());
      var response = await dioGet(
          propertySearch.toJson(), AppConstants.searchEndPoint, context);
      if (response.statusCode == 200) {
        emit(GetDataSuccessful());
        return propertyFromJson(response.data);
      } else {
        emit(GetDataError());
        throw Exception();
    }
  }
}
