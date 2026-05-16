import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../main.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_config.dart';
import '../components/progerss_indicator.dart';
import '../extensions/extension_util/duration_extensions.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/extension_util/widget_extensions.dart';
import '../extensions/text_styles.dart';
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

  init() async {
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
    // LocationPermissionScreen().launch(context);
    // MapLocationScreen().launch(context);
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
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset(icLogo, width: 100, fit: BoxFit.cover),
                20.height,
                Text(
                  appName,
                  style: boldTextStyle(color: Colors.white, size: 28),
                ),
                20.height,
                Text(
                  'Split smart. Pay simple',
                  style: primaryTextStyle(color: primaryColor, size: 18),
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
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Securing your connection...",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        "${(progress * 100).toInt()}%",
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      backgroundColor:  secondaryColor,
                      valueColor:
                      const AlwaysStoppedAnimation(
                       primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  /// Bottom Text
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.lock_outline,
                        color: primaryColor,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "BANK-GRADE ENCRYPTION",
                        style: TextStyle(
                          color: Colors.white54,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingAll(16),
            ),
          ],
        ),
      ),
    );
  }
}
