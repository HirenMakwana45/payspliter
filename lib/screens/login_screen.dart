import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payspliter/extensions/constants.dart';
import 'package:payspliter/extensions/extension_util/int_extensions.dart';
import 'package:payspliter/extensions/extension_util/widget_extensions.dart';
import 'package:payspliter/extensions/text_styles.dart';
import 'package:payspliter/screens/dashboard/dashboard_screen.dart';
import 'package:payspliter/screens/profile_setup_screen.dart';
import 'package:payspliter/screens/signup_screen.dart';
import '../Utils/app_config.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo & Brand Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: primaryTeal,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      appName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryTeal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Welcome Back Header
                 Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: boldTextStyle(
                    size: 28,
                    weight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // const SizedBox(height: 8),
                // const Text(
                //   'Log in to manage your shared expenses\nand split bills effortlessly.',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(fontSize: 14, color: textMuted, height: 1.4),
                // ),
                32.height,
                Text(
                  'Email Address',
                  style: secondaryTextStyle(
                    size: 14,
                    weight: fontWeightPrimaryGlobal,
                    color: textColor,
                  ),
                ),
                8.height,
                TextField(
                  decoration: InputDecoration(
                    prefixIcon:  Icon(
                      Icons.mail_rounded,
                      color: lightBlueColor,
                    ),
                    hintText: 'example@mail.com',
                    hintStyle: const TextStyle(color: lightBlueColor),
                    filled: true,
                    fillColor: fieldFillColor.withOpacity(0.5),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: fieldBorderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: primaryTeal,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                20.height,

                // Password Input Field
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                8.height,
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                      color: lightBlueColor,
                    ),
                    hintText: '*********',
                    hintStyle: const TextStyle(color: lightBlueColor),
                    filled: true,
                    fillColor: fieldFillColor.withOpacity(0.5),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: fieldBorderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: primaryTeal,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                24.height,

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child:

                  ElevatedButton(
                    onPressed: () {
                      ProfileSetupScreen().launch(context);
                      // OtpVerificationScreen().launch(context);
                    },
                    style:
                    ElevatedButton.styleFrom(
                      // Remove shadow (elevation: 0)
                      padding: EdgeInsets
                          .zero, // Remove default padding so container fills it
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Keep your corner radius here
                      ),
                    ).copyWith(
                      // Ensures the ink splash effect stays contained within the rounded corners
                      // elevation: WidgetStateProperty.all(0),
                    ),
                    child: Ink(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            gradientFirstColor,
                            primaryTeal, // Example secondary gradient color
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Must match the button's radius
                      ),
                      child: Container(
                        width: double
                            .infinity, // Optional: makes it full width
                        height:
                        50, // Replaces vertical padding with explicit height control
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: primaryTextStyle(
                                color: Colors.white,
                                size: 16,
                                weight: FontWeight.bold,
                              ),
                            ),
                            8.width,
                            Icon(
                              Icons.arrow_forward,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                24.height,

                // "Or continue with" Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.white.withOpacity(0.1)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Or Sign In With',
                        style: TextStyle(color: textMuted, fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.white.withOpacity(0.1)),
                    ),
                  ],
                ),
                24.height,

                // Social Media Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(icCall),
                    16.width,
                    _buildSocialButton(icGoogle), // Placeholder for Google
                    16.width,
                    _buildSocialButton(icApple),
                  ],
                ),
                32.height,


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetName) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(
        12,
      ), // Prevents the asset from touching the borders
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: lightGreyColor,
        border: Border.all(color: const Color(0xFF334155).withOpacity(0.3)),
      ),
      child: Image.asset(
        assetName,
        color: Colors.white,
        fit: BoxFit.contain, // Keeps your icon proportions intact
      ),
    ).onTap(() {});
  }
}
