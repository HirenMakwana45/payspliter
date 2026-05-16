// import 'package:flutter/material.dart';
// import 'package:payspliter/extensions/extension_util/int_extensions.dart';
//
// import '../extensions/text_styles.dart';
// import '../main.dart';
//
// class ThemeModeSelectorBottomSheet extends StatelessWidget {
//   const ThemeModeSelectorBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('Choose Appearance', style: boldTextStyle(size: 18)),
//           16.height,
//           settingOptionTile(context, 'Light Mode', Icons.wb_sunny, () {
//             // appStore.setDarkMode(false);
//             Navigator.pop(context);
//           }),
//           settingOptionTile(context, 'Dark Mode', Icons.nightlight_round, () {
//             appStore.setDarkMode(true);
//             Navigator.pop(context);
//           }),
//           settingOptionTile(context, 'System Default', Icons.brightness_auto, () {
//             final brightness = MediaQuery.of(context).platformBrightness;
//             appStore.setDarkMode(brightness == Brightness.dark);
//             Navigator.pop(context);
//           }),
//         ],
//       ),
//     );
//   }
//
//   Widget settingOptionTile(BuildContext context, String title, IconData icon, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, ),
//       title: Text(title, style: primaryTextStyle()),
//       onTap: onTap,
//     );
//   }
// }
