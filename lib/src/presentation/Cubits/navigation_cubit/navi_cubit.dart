import 'package:dart_secure/dart_secure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/localData_cubit/local_data_cubit.dart';
import '../../Modules/Home/home_page.dart';
import '../../Modules/SplashScreen/splash_screen.dart';

part 'navi_state.dart';

class NaviCubit extends Cubit<NaviState> {
  NaviCubit() : super(InitialNaviState());

  static NaviCubit get(context) => BlocProvider.of(context);

  void navigate(context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    emit(PagePushed(pageName: widget.toString()));
  }

  void navigateOff(context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
    emit(PagePushedOff(pageName: widget.toString()));
  }

  // void navigateToTempStopPage(context) {
  //   tempLockUser(context,
  //       afterCountNavigateTo: const TenantLoginScreen(),
  //       lockedPageMessage: "You are Locked! Please wait:",
  //       time: 10);
  //   emit(HomeState());
  // }

  void navigateToHome(context) {
    /// Remove all routes from the stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (route) => false,
    );
    emit(HomeState());
  }

  void navigateToAdmin(context) {
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const LoginPage()));
    emit(AdminState());
  }

  Future<void> navigateToSliderLogout(context) async {
    await LocalDataCubit.get(context).clearSharedAll();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
      (route) => false,
    );
    emit(IntoPageState());
  }

  void pop(context) {
    final currentRoute = ModalRoute.of(context);
    // Check if there is a previous route in the navigation stack
    if (currentRoute != null && currentRoute.canPop) {
      Navigator.pop(context);
    }
    emit(PagePopped(pageName: currentRoute.toString()));
  }
}
