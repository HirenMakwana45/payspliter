// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class DoubleBackToCloseApp extends StatefulWidget {
//   final SnackBar snackBar;
//   final Widget child;
//
//   const DoubleBackToCloseApp({
//     super.key,
//     required this.snackBar,
//     required this.child,
//   });
//
//   @override
//   State<DoubleBackToCloseApp> createState() => _DoubleBackToCloseAppState();
// }
//
// class _DoubleBackToCloseAppState extends State<DoubleBackToCloseApp> {
//   Completer<SnackBarClosedReason> _closedCompleter =
//   Completer<SnackBarClosedReason>()..complete(SnackBarClosedReason.remove);
//
//   bool get _isAndroid =>
//       Theme.of(context).platform == TargetPlatform.android;
//
//   bool get _isSnackBarVisible => !_closedCompleter.isCompleted;
//
//   bool get _willHandlePopInternally =>
//       ModalRoute.of(context)?.willHandlePopInternally ?? false;
//
//   @override
//   Widget build(BuildContext context) {
//     assert(() {
//       if (Scaffold.maybeOf(context) == null) {
//         throw FlutterError(
//           '`DoubleBackToCloseApp` must be wrapped in a Scaffold.',
//         );
//       }
//       return true;
//     }());
//
//     if (!_isAndroid) return widget.child;
//
//     return PopScope(
//       canPop: !_isSnackBarVisible && !_willHandlePopInternally,
//       onPopInvokedWithResult: (didPop, result) {
//         if (didPop || _willHandlePopInternally) return;
//         if (_isSnackBarVisible) return;
//
//         final messenger = ScaffoldMessenger.of(context);
//         messenger.hideCurrentSnackBar();
//         _closedCompleter =
//             messenger.showSnackBar(widget.snackBar).closed.wrapInCompleter();
//       },
//       child: widget.child,
//     );
//   }
// }
//
// extension<T> on Future<T> {
//   Completer<T> wrapInCompleter() {
//     final completer = Completer<T>();
//     then(completer.complete).catchError(completer.completeError);
//     return completer;
//   }
// }
