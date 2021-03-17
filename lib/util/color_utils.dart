import 'package:flutter/material.dart';

/// An extension for [Color] with several useful utilities.
extension ColorUtils on Color {
  /// The hex code [String] representation of [Color].
  ///
  /// ```dart
  /// Colors.white.toHex() == '0xFFFFFF'
  /// ```
  String toHex() => '#${value.toRadixString(16).substring(2).toUpperCase()}';

  /// The [Color] that is accessible and readable atop of the main color.
  ///
  /// Can be either [Colors.white] or [Colors.black].
  ///
  /// ```dart
  /// Colors.black.contrastingColor == Colors.white
  /// ```
  Color get contrastingColor {
    if (ThemeData.estimateBrightnessForColor(this) == Brightness.dark) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
