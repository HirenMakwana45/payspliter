import 'package:flutter/material.dart';
import '../Utils/app_colors.dart';
import '../extensions/extension_util/context_extensions.dart';
import '../../extensions/extension_util/int_extensions.dart';
import '../../extensions/extension_util/widget_extensions.dart';
import '../extensions/text_styles.dart';
import '../utils/app_images.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(noInternet,
              height: context.height() * 0.2,
              width: context.width() * 0.4,
              color: primaryColor),
          16.height,
          Text('No Internet', style: boldTextStyle(size: 20)),
        ],
      ).center(),
    );
  }
}
