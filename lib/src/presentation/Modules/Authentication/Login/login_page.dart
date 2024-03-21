import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../config/utils/styles/app_colors.dart';
import '../../../Shared/Components.dart';
import '../../../Shared/WidgetBuilders.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        fadedText(
            context: context,
            text: "Welcome to Ayatt!",
            textColor: AppColors.primaryLight,
            paddingSize: const EdgeInsets.only(left: 20),
            fontWeight: FontWeight.w600,
            textSize: getWidth(5, context)),
        fadedText(
            context: context,
            text: "How would you like to Login?",
            textColor: AppColors.darkColor,
            paddingSize: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
            fontWeight: FontWeight.w600,
            textSize: getWidth(3, context)),
        getCube(2, context),

        // will make separated pages for future customization
        Center(
          child: loadButton(
              onPressed: () {

              },
              buttonText: 'Tenant',
              backgroundColor: AppColors.primaryLight,
              textSize: 20),
        ),
        getCube(3, context),
        Center(
          child: loadButton(
              onPressed: () {

              },
              buttonText: 'Owner',
              textSize: 20),
        ),
        getCube(3, context),
        Center(
            child: loadButtonOutline(
                onPressed: () {

                },
                buttonText: 'Agent',
                textSize: 20)),
        getCube(3, context),
        fadedText(
            context: context,
            text: "Are you a new user?",
            textColor: AppColors.darkColor,
            paddingSize: const EdgeInsets.all(30),
            fontWeight: FontWeight.w600,
            textSize: getWidth(3, context)),
        Center(
          child: loadButton(
              onPressed: () {

              },
              buttonText: 'Sign Up',
              borderCurveSize: 10,
              backgroundColor: AppColors.darkColor,
              textSize: 20),
        ),
        getCube(5, context),
      ],
    );
  }
}
