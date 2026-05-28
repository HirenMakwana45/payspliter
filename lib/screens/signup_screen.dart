import 'package:flutter/material.dart';
import 'package:payspliter/extensions/extension_util/widget_extensions.dart';
import 'package:payspliter/screens/login_screen.dart';

import '../Utils/app_colors.dart';
import '../utils/app_images.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // --------------------------------------------
            // FROZEN HEADER (Stays fixed at the top)
            // --------------------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              color: const Color(0xFF0C1B1E), // Matches the header background tint
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: primaryTeal,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'PaySpliterr',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent[400],
                    ),
                  ),
                ],
              ),
            ),

            // --------------------------------------------
            // SCROLLABLE CONTENT (Form elements scroll under)
            // --------------------------------------------
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.03)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Welcome Header
                        const Text(
                          'Welcome',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Full Name Input Field
                        const Text(
                          'Full Name',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: _buildInputDecoration(
                            hintText: 'Full Name',
                            prefixIcon: Icons.person_outline,
                            fillColor: fieldFillColor,
                            borderColor: fieldBorderColor,
                            hintColor: textMuted,
                            focusColor: primaryTeal,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Email Input Field
                        const Text(
                          'Email',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: _buildInputDecoration(
                            hintText: 'example@mail.com',
                            prefixIcon: Icons.mail_outline,
                            fillColor: fieldFillColor,
                            borderColor: fieldBorderColor,
                            hintColor: textMuted,
                            focusColor: primaryTeal,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password Input Field
                        const Text(
                          'Password',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: true,
                          decoration: _buildInputDecoration(
                            hintText: '*********',
                            prefixIcon: Icons.lock_outline,
                            fillColor: fieldFillColor,
                            borderColor: fieldBorderColor,
                            hintColor: textMuted,
                            focusColor: primaryTeal,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Confirm Password Input Field
                        const Text(
                          'Confirm Password',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: true,
                          decoration: _buildInputDecoration(
                            hintText: '*********',
                            prefixIcon: Icons.password_outlined,
                            fillColor: fieldFillColor,
                            borderColor: fieldBorderColor,
                            hintColor: textMuted,
                            focusColor: primaryTeal,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Next Action Button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: primaryTeal.withOpacity(0.25),
                                blurRadius: 15,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryTeal,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              elevation: 0,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, size: 18),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // "Or continue with" Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white.withOpacity(0.07))),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text('Or continue with', style: TextStyle(color: textMuted, fontSize: 12)),
                            ),
                            Expanded(child: Divider(color: Colors.white.withOpacity(0.07))),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Social Media Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialButton(icCall),
                            const SizedBox(width: 16),
                            _buildSocialButton(icGoogle),
                            const SizedBox(width: 16),
                            _buildSocialButton(icApple),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Footer Toggle text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? ", style: TextStyle(color: textMuted, fontSize: 14)),
                            GestureDetector(
                              onTap: () {
                                LoginScreen().launch(context);
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(color: primaryTeal, fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                          ],
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
    );
  }
  // Reusable Decoration Builder for Input Fields
  InputDecoration _buildInputDecoration({
    required String hintText,
    required IconData prefixIcon,
    required Color fillColor,
    required Color borderColor,
    required Color hintColor,
    required Color focusColor,
  }) {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon, color: hintColor, size: 20),
      hintText: hintText,
      hintStyle: TextStyle(color: hintColor),
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: focusColor, width: 1.5),
      ),
    );
  }

  // Social Button Widget utilizing Image.asset with clean containment
  Widget _buildSocialButton(String assetName) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1E2E32).withOpacity(0.3),
        border: Border.all(color: const Color(0xFF334A50).withOpacity(0.2)),
      ),
      child: Image.asset(
        assetName,
        color: const Color(0xFF94A3B8),
        fit: BoxFit.contain,
      ),
    );
  }
}
