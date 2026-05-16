// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';
//
// import 'package:flutter/material.dart';
//
// DateTime? _currentBackPressTime;
//
// /// DoublePressBackWidget
// class DoublePressBackWidget extends StatelessWidget {
//   final Widget child;
//   final String? message;
//   final PopScope? onWillPop;
//
//   const DoublePressBackWidget({
//     super.key,
//     required this.child,
//     this.message,
//     this.onWillPop,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false, // IMPORTANT
//       onPopInvoked: (didPop) {
//         if (didPop) return;
//
//         final now = DateTime.now();
//         onWillPop?.call();
//
//         if (_currentBackPressTime == null ||
//             now.difference(_currentBackPressTime!) >
//                 const Duration(seconds: 2)) {
//           _currentBackPressTime = now;
//
//           return;
//         }
//
//         Navigator.of(context).pop();
//       },
//       child: child,
//     );
//   }
//
// }
