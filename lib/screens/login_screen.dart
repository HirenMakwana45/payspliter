import 'package:flutter/material.dart';
import 'package:payspliter/Utils/app_colors.dart';
import 'package:payspliter/extensions/text_styles.dart';
import 'package:payspliter/extensions/widgets.dart';
import 'package:payspliter/utils/app_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        // titleWidget: Row(children: []),
        appName,
        titleTextStyle: boldTextStyle(color: primaryColor),
        // titleWidget: Text(''),actions: [],
        showBack: false,
        context: context,
      ),
    );
  }
}
