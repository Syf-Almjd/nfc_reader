import 'dart:convert';

import 'package:dart_secure/dart_secure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/utils/managers/app_constants.dart';
import '../../../domain/models/login/user_login_model.dart';
import '../../remote/RemoteData_cubit/RemoteData_cubit.dart';

part 'local_data_state.dart';

class LocalDataCubit extends Cubit<LocalDataState> {
  LocalDataCubit() : super(LocalDataInitial());

  static LocalDataCubit get(context) => BlocProvider.of(context);

  ///LOCAL DATA

  //Update Shared Local Data of current user
  Future<void> updateSharedUser(context) async {
    emit(UpdatingLocalData());
    try {
      // var getData = await RemoteDataCubit.get(context).getUserData();
      // saveSharedMap('currentuser', getData.toJson());
      emit(LocalDataSuccessful());
    } catch (e) {
      emit(LocalDataFailed());
    }
  }

  Future<void> saveSharedMap(String mapName, Map mapData) async {
    emit(UpdatingLocalData());
    String jsonString = jsonEncode(mapData);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(mapName, jsonString);
      emit(LocalDataSuccessful());
    } catch (e) {
      emit(LocalDataFailed());
    }
  }
  Future<LoginModelResponse> getSharedToken() async {
    emit(GettingLocalData());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonString = prefs.getString(AppConstants.userApiToken);
      Map<String, dynamic> savedData = jsonDecode(jsonString!);
      emit(LocalDataSuccessful());
      return LoginModelResponse.fromJson(savedData);
    } catch (e) {
      emit(LocalDataFailed());
      return LoginModelResponse(message: "", token: "");
    }
  }

  Future<void> updateSharedToken(context) async {
    emit(GettingLocalData());
    try {
      var userData = LoginModelRequest.fromJson(await getSharedMap(AppConstants.currentUser));
      await RemoteDataCubit.get(context).loginUser(userData, context);
      emit(LocalDataSuccessful());
    } catch (e) {
      emit(LocalDataFailed());
    }
  }



  Future<Map<String, dynamic>> getSharedMap(String mapName) async {
    emit(GettingLocalData());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonString = prefs.getString(mapName);
      Map<String, dynamic> savedData = jsonDecode(jsonString!);
      emit(LocalDataSuccessful());
      return savedData;
    } catch (e) {
      emit(LocalDataFailed());
      return Future.error("Data Doesn't exist or Wrong Map Name {Can be IGNORE}");
    }
  }

  //Save Shared Local Data of current user
  Future<void> saveSharedData(Map data) async {
    emit(UpdatingLocalData());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      data.forEach((key, value) {
        prefs.setString(key, value);
      });
      emit(LocalDataSuccessful());
    } catch (e) {
      emit(LocalDataFailed());
    }
  }

  Future<void> clearSharedAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  //Get Shared Local Data of current user as list of values
  Future<List?> getSharedList(List keys) async {
    emit(UpdatingLocalData());
    List data = [];
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      for (var element in keys) {
        data.add(prefs.getString(element));
      }
      emit(LocalDataSuccessful());
      return data;
    } catch (e) {
      emit(LocalDataFailed());
    }
    return data;
  }

  //Get the biometric auth from current user
  Future<bool> getBioAuthentication() async {
    emit(GettingLocalData());

    var authStatus = await biometricAuth(
        stickyAuth: true,
        biometricOnly: false,
        sensitiveTransaction: true,
        userErrorDialogs: true,
        message: "Please verify your identity to continue!");

    if (authStatus == AuthenticationStatus.successful) {
      emit(LocalDataSuccessful());
      return true;
    } else {
      emit(LocalDataFailed());
      return false;
    }
  }
}
