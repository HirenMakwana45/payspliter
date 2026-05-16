import 'package:flutter/material.dart';

// Color Extensions

extension ColorBrightness on Color {
  double get brightness {
    final int redInt = (r * 255).round().clamp(0, 255);
    final int greenInt = (g * 255).round().clamp(0, 255);
    final int blueInt = (b * 255).round().clamp(0, 255);

    return (redInt * 299 + greenInt * 587 + blueInt * 114) / 1000;
  }
}

extension Hex on Color {
  /// return hex String
  String toHex({bool includeAlpha = true}) {
    final int a = (this.a * 255.0).round().clamp(0, 255);
    final int r = (this.r * 255.0).round().clamp(0, 255);
    final int g = (this.g * 255.0).round().clamp(0, 255);
    final int b = (this.b * 255.0).round().clamp(0, 255);

    return '${includeAlpha ? a.toRadixString(16).padLeft(2, '0') : ''}'
        '${r.toRadixString(16).padLeft(2, '0')}'
        '${g.toRadixString(16).padLeft(2, '0')}'
        '${b.toRadixString(16).padLeft(2, '0')}';
  }

  /// Return true if given Color is dark
  bool isDark() => brightness < 128.0;

  /// Return true if given Color is light
  bool isLight() => !isDark();

  /// Returns Brightness of give Color

  // double getBrightness() =>
  //     (redInt * 299 + green * 587 + blue * 114) / 1000;

  /// Returns Luminance of give Color
  double getLuminance() => computeLuminance();
}
