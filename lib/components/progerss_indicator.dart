// import 'package:flutter/material.dart';
//
// class SecureConnectionLoader extends StatelessWidget {
//   final double progress; // 0.0 to 1.0
//
//   const SecureConnectionLoader({
//     super.key,
//     required this.progress,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 24,
//         vertical: 20,
//       ),
//       decoration: BoxDecoration(
//         color: const Color(0xFF0B0F14),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           /// Top Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Securing your connection...",
//                 style: TextStyle(
//                   color: Colors.white70,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//
//               Text(
//                 "${(progress * 100).toInt()}%",
//                 style: const TextStyle(
//                   color: Color(0xFF00D1C7),
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 18),
//
//           /// Progress Bar
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: LinearProgressIndicator(
//               value: progress,
//               minHeight: 10,
//               backgroundColor: const Color(0xFF12343A),
//               valueColor: const AlwaysStoppedAnimation(
//                 Color(0xFF00D1C7),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 22),
//
//           /// Bottom Label
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(
//                 Icons.lock_outline,
//                 color: Color(0xFF00D1C7),
//                 size: 16,
//               ),
//               SizedBox(width: 8),
//               Text(
//                 "BANK-GRADE ENCRYPTION",
//                 style: TextStyle(
//                   color: Colors.white54,
//                   fontSize: 16,
//                   letterSpacing: 1.5,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }