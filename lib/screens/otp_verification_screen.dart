import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_config.dart';
import '../extensions/app_button.dart';
import '../extensions/common.dart';
import '../extensions/constants.dart';
import '../extensions/extension_util/context_extensions.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/extension_util/widget_extensions.dart';
import '../extensions/loader_widget.dart';
import '../extensions/otp_text_field.dart';
import '../extensions/text_styles.dart';
import '../main.dart';
import '../utils/app_common.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen>
    with TickerProviderStateMixin {
  // Focus nodes for auto-shifting focus across the 6 OTP fields
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  String otpCode = '';
  int _start = 60;
  bool _canResendOTP = false;
  Timer? _timer;
  bool isResend = false;
  String resendVerificationId = '';

  GlobalKey<OTPTextFieldState> otpTextFieldKey = GlobalKey<OTPTextFieldState>();

  void startTimer() {
    _start = 60;
    _canResendOTP = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        _start--;
        if (mounted) {
          setState(() {});
        }
      } else {
        timer.cancel();
        if (mounted) {
          setState(() {
            _canResendOTP = true;
          });
        }
      }
    });
  }
  Widget otpInputField() {
    return OTPTextField(
      key: otpTextFieldKey,
      pinLength: 6,
      fieldWidth: context.width() * 0.1,
      onChanged: (s) {
        otpCode = s;
      },
      onCompleted: (pin) {
        otpCode = pin;
        // submit();
        // submit();
        // UserDetails().launch(context);
      },
    ).center();
  }
  void resendOtpFunction() {
    if (_canResendOTP) {
      isResend = true;
      reSendOTP();
      startTimer();
    } else {
      // toast('You cannot resend OTP yet. Please wait.');
    }
  }
  Future<void> reSendOTP({bool isResend = false}) async {
    hideKeyboard(context);
    // appStore.setLoading(true);

    // String number = widget.phoneNumber.toString();

    // print("Number is " + number.toString());

    // await resendOTP(
    //   context,
    //   number,
    //   widget.phoneNumber!,
    // ).then((value) {}).catchError((e) {
    //   toast(e.toString());
    //   appStore.setLoading(false);
    // });
  }


  @override
  void dispose() {
    _timer?.cancel();
    // SmsAutoFill().unregisterListener();
    // _otpController.dispose(); // Dispose the controller to free resources

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldLeave = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text(
              'Do you want to go back? This will cancel OTP verification.',
            ),
            actions: [
              TextButton(onPressed: () => pop(false), child: Text('No')),
              TextButton(onPressed: () => pop(true), child: Text('Yes')),
            ],
          ),
        );
        return shouldLeave ?? false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Stack(
            children: [

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
                      // 26.height,
                      // Text(
                      //   'Verification Code',
                      //   style: secondaryTextStyle(
                      //     weight: fontWeightPrimaryGlobal,
                      //     color: Colors.white,
                      //   ),
                      // ),





                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          50.height,
                          Text('Verify Phone Number', style: boldTextStyle(size: 22)),
                          Text(
                            '${'We have sent the code verification to'} '
                                ''
                                '${00000000}',
                            style: secondaryTextStyle(),
                          ),
                          30.height,
                          // PinFieldAutoFill(
                          //   codeLength: 6,
                          //   onCodeChanged: (code) {
                          //     setState(() {
                          //       otpCode = code; // Update the 1 code manually if needed
                          //     });
                          //   },
                          // ),
                          otpInputField(),

                          // OTPTextField(
                          //   pinLength: 6,
                          //   fieldWidth: context.width() * 0.1,
                          //   onChanged: (s) {
                          //     otpCode = s;
                          //     print("otp code is ==>" + s.toString());
                          //     setState(
                          //       () {},
                          //     );
                          //   },
                          //   onCompleted: (pin) {
                          //     otpCode = pin;
                          //     submit();
                          //     // UserDetails().launch(context);
                          //   },
                          // ).center(),
                          30.height,
                          StatefulBuilder(
                            builder: (context, setState) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Didn't receive OTP?",
                                    style: primaryTextStyle(),
                                  ),
                                  GestureDetector(
                                    child: Row(
                                      children: [
                                        Text(
                                          _canResendOTP ? 'Resend' : '',
                                          style: primaryTextStyle(color: primaryTeal),
                                        ).paddingLeft(4),
                                        if (!_canResendOTP)
                                          Container(
                                            width: 120,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '$_start seconds',
                                              style: primaryTextStyle(
                                                color: primaryTeal,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    onTap: () {
                                      if (_canResendOTP) {
                                        resendOtpFunction();
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                          30.height,
                        ],
                      ),
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
                                    'Verify & Proceed',
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
                    ],


                  ),
                ),
              ).center(),

              Observer(
                builder: (context) {
                  return Loader().center().visible(appStore.isLoading);
                },
              ),
            ],
          ),

          // floatingActionButton: AppButton(
          //   text: 'Verify & Proceed',
          //   width: 358,
          //   height: 48,
          //   color: primaryColor,
          //   onTap: () {
          //     if (otpCode.length == 6) {
          //       // submit();
          //     } else {
          //       showToast('invalid Otp');
          //     }
          //   },
          // ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
