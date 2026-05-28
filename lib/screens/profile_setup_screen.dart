import 'package:flutter/material.dart';
import 'package:payspliter/extensions/extension_util/widget_extensions.dart';
import 'package:payspliter/screens/dashboard/dashboard_screen.dart';
import 'package:payspliter/utils/app_images.dart';

import '../Utils/app_colors.dart';
import '../extensions/constants.dart';
import '../extensions/extension_util/int_extensions.dart';
import '../extensions/text_styles.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Safe space at top or back navigation area
              60.height,
      
              // Profile Picture Stack overlapping the main sheet card
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 85),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 75, bottom: 32),                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Inner Setup Profile Header
                        Center(
                          child: Text(
                            'Setup Profile',
                            style: boldTextStyle(
                              size: 24,
                              weight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        32.height,
      
                        // Full Name Field
                        Text(
                          'Full Name',
                          style: secondaryTextStyle(size: 14, color: Colors.white),
                        ),
                        8.height,
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: _buildInputDecoration(
                            hintText: 'Full Name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: lightBlueColor,
                            ),
                          ),
                        ),
                        20.height,
      
                        // Email Address Field
                        Text(
                          'Email Address',
                          style: secondaryTextStyle(size: 14, color: Colors.white),
                        ),
                        8.height,
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: _buildInputDecoration(
                            hintText: 'example@mail.com',
                            prefixIcon: Icon(
                              Icons.mail,
                              color: lightBlueColor,
                            ),
                          ),
                        ),
                        20.height,
      
                        // Create Password Field
                        Text(
                          'Create Password',
                          style: secondaryTextStyle(size: 14, color: Colors.white),
                        ),
                        8.height,
                        TextField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: _buildInputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.password_rounded,
                              color: lightBlueColor,
                            ),
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.all(14.0),
                            //   // Custom styling/text representation for password icons match layout
                            //   child: Text(
                            //     '***',
                            //     style: boldTextStyle(color: lightBlueColor, size: 14),
                            //   ),
                            // ),
                          ),
                        ),
                        20.height,
      
                        // UPI ID Field (REMOVED obscureText so text remains readable)
                        Text(
                          'UPI ID',
                          style: secondaryTextStyle(size: 14, color: Colors.white),
                        ),
                        8.height,
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: _buildInputDecoration(
                            hintText: 'example@oksbi',
                            prefixIcon: Image.asset(
                              width: 16,
                              height: 10,
                              icUpi,
                              color: lightBlueColor,
                              fit: BoxFit.contain,
                            ).paddingOnly(bottom: 16,top: 16,left: 16,right: 6),
                          ),
                        ),
                        20.height,
      
                        // Currency Field (REMOVED obscureText so text remains readable)
                        Text(
                          'Currency',
                          style: secondaryTextStyle(size: 14, color: Colors.white),
                        ),
                        8.height,
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: _buildInputDecoration(
                            hintText: 'Rupees',
                            prefixIcon: Image.asset(
                              width: 16,
                              height: 15,
                              icRupee,
                              color: lightBlueColor,
                              fit: BoxFit.contain,
                            ).paddingOnly(bottom: 12,top: 12,left: 12,right: 4),
                          ),
                        ),
                        32.height,
      
                        // Save Action Button
                        ElevatedButton(
                          onPressed: () {
                            DashboardScreen().launch(context);
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
                              child: Text(
                                'Save',
                                style: primaryTextStyle(
                                  color: Colors.white,
                                  size: 16,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        24.height,
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0, // Keeps it resting right on the upper threshold line
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.12),
                                blurRadius: 40,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 100,
                              color: lightBlueColor,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: const Color(0xFF246BFD),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

      
            ],
          ),
        ),
      ),
    );
  }

  // Reusable decoration rules matching text form styling inside image_cc4599.png
  InputDecoration _buildInputDecoration({
    required String hintText,
    required Widget prefixIcon,
  }) {

    return InputDecoration(
      prefixIcon: prefixIcon,
      hintText: hintText,
      hintStyle: TextStyle(
        color: lightBlueColor,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      filled: true,
      fillColor: fieldFillColor.withOpacity(0.5),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: fieldBorderColor, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryTeal, width: 1.5),
      ),
    );
  }
}
