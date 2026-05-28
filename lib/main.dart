import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payspliter/screens/login_screen.dart';
import 'package:payspliter/screens/mobile_login_screen.dart';
import 'package:payspliter/screens/no_internet_screen.dart';
import 'package:payspliter/screens/splash_screen.dart';
import 'package:payspliter/store/UserStore/UserStore.dart';
import 'package:payspliter/store/app_store.dart';
import 'package:payspliter/utils/app_common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import 'Utils/app_config.dart';
import 'app_theme.dart';
import 'extensions/common.dart';
import 'extensions/system_utils.dart';

UserStore userStore = UserStore();
AppStore appStore = AppStore();

late SharedPreferences sharedPreferences;
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: fIREBASEANDROIDAPIKEY,
  //         appId: fIREBASEANDROIDAPPID,
  //         messagingSenderId: fIREBASEANDROIDMESSAGINGSENDERID,
  //         projectId: fIREBASEANDROIDPROJECTID)
  // )
  //     .then((value) {
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // });
  sharedPreferences = await SharedPreferences.getInstance();


  // setLogInValue();
  // defaultAppButtonShapeBorder = RoundedRectangleBorder(borderRadius: radius(defaultAppButtonRadius));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}
class MyApp extends StatefulWidget {
  static String tag = '/MyApp';

  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool isCurrentlyOnNoInternet = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((e) {
      if (e.contains(ConnectivityResult.none)) {
        log('not connected');
        isCurrentlyOnNoInternet = true;
        push(NoInternetScreen());
      } else {
        if (isCurrentlyOnNoInternet) {
          pop();
          isCurrentlyOnNoInternet = false;
          showToast(
            'Internet is connected',
            type: ToastificationType.error,
            progressColor: Colors.red,
          );
        }
        log('connected');
      }
    });
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: appName,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        scrollBehavior: SBehavior(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        localeResolutionCallback: (locale, supportedLocales) => locale,
        home:SplashScreen(),
      );
    });
  }
}
