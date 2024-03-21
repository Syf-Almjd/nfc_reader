import 'package:flutter/material.dart';
import '../../../config/utils/managers/app_assets.dart';
import '../../Shared/Components.dart';
import '../../Shared/WidgetBuilders.dart';

class AuthenticationLayout extends StatefulWidget {
  const AuthenticationLayout({super.key});

  @override
  State<AuthenticationLayout> createState() => _AuthenticationLayoutState();
}

class _AuthenticationLayoutState extends State<AuthenticationLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: getHeight(30, context),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(200)),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(50)),
                  child: Image.asset(
                    AppAssets.houseSample,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                right: -20,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(150),
                          bottomLeft: Radius.circular(50))),
                  child: Image.asset(
                    AppAssets.appLogo,
                    scale: 5,
                  ),
                ),
              ),
            ],
          ),
          // Expanded(
          //   child: BlocBuilder<SigningBloc, SigningState>(
          //       builder: (context, state) {
          //     if (state is LoginLayoutState) {
          //       return const LoginPage();
          //     }
          //     if (state is AgentLoginState) {
          //       return const AgentLoginScreen();
          //     }
          //     if (state is OwnerLoginState) {
          //       return const OwnerLoginScreen();
          //     }
          //     if (state is TenantLoginState) {
          //       return const TenantLoginScreen();
          //     }
          //     if (state is RegisterUserState) {
          //       return const RegisterScreen();
          //     } else {
          //       return const LoginPage();
          //     }
          //   }),
          // ),
          appFooter(context),
        ],
      ),
    );
  }
}
