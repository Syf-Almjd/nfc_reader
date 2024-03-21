import 'package:flutter/material.dart';

import '../../../config/utils/managers/app_assets.dart';
import '../../Cubits/navigation_cubit/navi_cubit.dart';
import '../../Shared/Components.dart';
import '../../Shared/WidgetBuilders.dart';
import '../Authentication/authentication_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appLogoPreview(context: context, width: getWidth(100, context),
              height: getHeight(65, context),
              wBackground: false),
          gifPreview(context: context,filePath: AppAssets.splashGif, height: getHeight(8, context)),

          //TODO compare and delete if no need
          // fadedText(context: context, text: "All you need for a Home!"
          // ,textSize: getWidth(4, context),
          //   fontWeight: FontWeight.w600
          // ),
          loadButtonOutline(onPressed: () {
            NaviCubit.get(context).navigate(context, const AuthenticationLayout());
          }, buttonText: "Let's Get Started!", textSize: getWidth(5, context)),
          getCube(2, context)
        ],
      ),
    );
  }
}
