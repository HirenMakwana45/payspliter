import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payspliter/extensions/constants.dart';
import 'package:payspliter/extensions/extension_util/int_extensions.dart';
import 'package:payspliter/extensions/extension_util/widget_extensions.dart';
import 'package:payspliter/extensions/text_styles.dart';
import 'package:payspliter/screens/dashboard/dashboard_screen.dart';
import 'package:payspliter/screens/otp_verification_screen.dart';
import 'package:payspliter/screens/signup_screen.dart';
import '../Utils/app_config.dart';
import '../extensions/app_text_field.dart';
import '../extensions/decorations.dart';
import '../extensions/shared_pref.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_images.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  GlobalKey<FormState> mFormKey = GlobalKey<FormState>();

  TextEditingController mPhoneNumberCont = TextEditingController();
  FocusNode mPhoneNumber = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body:
        SingleChildScrollView(
          child:
          Container(
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
                   8.width,
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
               26.height,

                // Welcome Back Header
                const Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
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
                Row(
                  children: [
                    Text(
                      'Mobile Number',
                      style: secondaryTextStyle(
                        weight: fontWeightPrimaryGlobal,
                        color: textColor,
                      ),
                    ),
                    2.width,
                    Text('*', style: secondaryTextStyle(color: redColorNew)),
                  ],
                ),
                4.height,

                AppTextField(
                  controller: mPhoneNumberCont,
                  textFieldType: TextFieldType.pHONE,
                  isValidationRequired: true,
                  maxLength: 10,
                  cursorColor: lightBlueColor,
                  textStyle: primaryTextStyle(color: Colors.white),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Phone number';
                    } else if (value.length < 10) {
                      return 'Phone number must be 10 digits long';
                    }
                    return null;
                  },
                  decoration:
                      defaultInputDecoration(
                        context,

                        label: 'Enter Phone Number',
                        textStyle: secondaryTextStyle(color: Colors.white),
                        mPrefix: IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CountryCodePicker(
                                initialSelection: getStringAsync(
                                  cOUNTRYCODE,
                                  defaultValue: countryCode!,
                                ),
                                showCountryOnly: false,
                                showFlag: false,
                                boxDecoration: BoxDecoration(
                                  borderRadius: radius(defaultRadius),
                                ),
                                showFlagDialog: true,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                textStyle: primaryTextStyle(
                                  color: Colors.white,
                                ),
                                onInit: (c) {
                                  countryCode = c!.dialCode;
                                  setValue(cOUNTRYCODE, c.code);
                                },
                                onChanged: (c) {
                                  countryCode = c.dialCode;
                                  setValue(cOUNTRYCODE, c.code);
                                },
                              ),
                              VerticalDivider(
                                color: Colors.white30,
                              ), // Made divider lighter                            16.width,
                            ],
                          ),
                        ),
                      ).copyWith(
                        counterStyle: TextStyle(color: lightBlueColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide: BorderSide(
                            color: lightBlueColor,
                            width: 1.0,
                          ),
                        ),
                      ),
                ),

                20.height,

                // Login Button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child:

                      ElevatedButton(
                        onPressed: () {
                          OtpVerificationScreen().launch(context);
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
                                primaryTeal,
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
                                  'Send OTP',
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Or Sign In With',
                        style: secondaryTextStyle(color: textMuted, size: 12),
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
                    _buildSocialButton(icEmailFill),
                    16.width,
                    _buildSocialButton(icGoogle),
                    16.width,
                    _buildSocialButton(icApple),
                  ],
                ),
              ],
            ),
          ),
        ).center(),
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
        fit: BoxFit.contain,
      ),
    ).onTap(() {});
  }
}
