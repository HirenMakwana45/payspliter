import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payspliter/screens/mobile_login_screen.dart';

import '../../../main.dart';
import '../Utils/app_config.dart';
import '../extensions/extension_util/duration_extensions.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/extension_util/widget_extensions.dart';
import '../extensions/text_styles.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // await 2.seconds.delay;
    timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        progress += 0.01;
      });

      if (progress >= 1.0) {
        progress = 1.0;
        timer.cancel();

        Future.delayed(const Duration(milliseconds: 300), () {
          LoginScreen().launch(context);
        });
      }
    });
    if (!mounted) return;

    // LoginScreen().launch(context);
    // if (!getBoolAsync(IS_FIRST_TIME)) {
    //   WalkThroughScreen().launch(context, isNewTask: true);
    // } else {
    //   if (userStore.isLoggedIn) {
    //    const DashboardScreen().launch(context, isNewTask: true);
    //   } else {
    //      SignInScreen().launch(context, isNewTask: true);
    //   }
    // }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarIconBrightness:
        // appStore.isDarkMode ? Brightness.light : Brightness.dark,
        // systemNavigationBarIconBrightness:
        // appStore.isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      gradient: LinearGradient(
                        colors: [gradientFirstColor, primaryTeal],
                      ),
                    ),
                    child: Image.asset(
                      icLogo,
                      width: 86,
                      height: 86,
                      fit: BoxFit.cover,
                    ).paddingAll(30),
                  ),
                  10.height,
                  Text(
                    appName,
                    style: boldTextStyle(color: Colors.white, size: 28),
                  ),
                  10.height,
                  Text(
                    'Split smart. Pay simple',
                    style: primaryTextStyle(
                      color: lightSecondaryColor,
                      size: 18,
                    ),
                  ),
                ],
              ).center(),
              Positioned(
                left: 20,
                right: 20,
                bottom: 40,
                child: Column(
                  children: [
                    /// Progress Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "Securing your connection...",
                          style: secondaryTextStyle(color: Colors.white70, size: 14),
                        ),

                        Text(
                          "${(progress * 100).toInt()}%",
                          style:  secondaryTextStyle(
                            color: secondaryColor,
                            size: 10,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    16.height,

                    /// Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 6,
                        backgroundColor: fieldFillColor,
                        valueColor: const AlwaysStoppedAnimation(lightSecondaryColor),
                      ),
                    ),
                  ],
                ).paddingAll(16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
