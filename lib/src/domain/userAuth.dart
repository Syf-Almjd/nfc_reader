import 'package:nfc_reader/src/config/utils/managers/app_constants.dart';
import 'package:nfc_reader/src/data/local/localData_cubit/local_data_cubit.dart';
import 'package:nfc_reader/src/domain/models/login/user_login_model.dart';
import 'package:nfc_reader/src/presentation/Modules/Home/home_page.dart';
import 'package:nfc_reader/src/presentation/Shared/Components.dart';
import 'package:dart_secure/dart_secure.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../presentation/Modules/SplashScreen/splash_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

@override
  Widget build(BuildContext context) {
  return FutureBuilder(future: LocalDataCubit.get(context).getSharedToken(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting){
      return Scaffold(
        body: Center(
          child: loadingAnimation(),
        ),
      );
    }
    if (snapshot.hasError || snapshot.data==null){
      return const SplashScreen(
      );
    }
    if (snapshot.data!.token.isNotEmpty && snapshot.data!.token != ""){
        return const HomePage();
      }
      else{
        return const SplashScreen();
      }
  },);
  }
}
