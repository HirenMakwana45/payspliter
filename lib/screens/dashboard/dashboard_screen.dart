import 'package:flutter/material.dart';
import 'package:payspliter/extensions/extension_util/widget_extensions.dart';
import 'package:payspliter/screens/dashboard/group_screen.dart';
import 'package:payspliter/screens/dashboard/profile_screen.dart';
import 'package:payspliter/screens/notification_screen.dart';
import 'package:payspliter/utils/app_images.dart';

import '../../Utils/app_colors.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  // List of screens for bottom navigation routing
  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text('Friends Screen', style: TextStyle(color: Colors.white))),
    const GroupScreen(),
    const Center(child: Text('Personal Screen', style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor, // Match your app background color configuration

      // IndexedStack prevents screens from rebuilding completely when switching tabs
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      // Integrated Custom Pill Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

/// --- Custom Bottom Navigation Bar matching your image asset ---
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    const Color inactiveColor = Colors.white;

    // Layout configuration map array
    final List<Map<String, dynamic>> navItems = [
      {'icon': icHome, 'label': 'HOME'},
      {'icon': icFriends, 'label': 'FRIENDS'},
      {'icon': icGroups, 'label': 'GROUP'},
      {'icon': icBook, 'label': 'PERSONAL'},
    ];

    return Container(
      height: 90,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      color: Colors.transparent, // Ensures no solid system colors leak around outer corners
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: fieldFillColor.withOpacity(0.8),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double segmentWidth = constraints.maxWidth / navItems.length;

            return Stack(
              children: [
                // Sliding Circle Neon Glow Base Indicator
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  left: currentIndex * segmentWidth + (segmentWidth - 60) / 2,
                  top: (constraints.maxHeight - 60) / 2,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: primaryTeal.withOpacity(0.25),
                        width: 1,
                      ),
                      gradient: RadialGradient(
                        colors: [
                          primaryTeal.withOpacity(0.20),
                          Colors.transparent,
                        ],
                        radius: 0.5,
                      ),
                    ),
                  ),
                ),

                // Interactive Icon Layer Content Row
                Row(
                  children: List.generate(navItems.length, (index) {
                    bool isSelected = currentIndex == index;

                    return Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onTap(index),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              navItems[index]['icon'],
                              height: 24,
                              color: isSelected ? primaryTeal : inactiveColor,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              navItems[index]['label'],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.6,
                                color: isSelected ? primaryTeal : inactiveColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}