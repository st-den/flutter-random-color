import 'dart:math';

import 'package:flutter/material.dart';

/// A (pseudo-)random color generator.
class RandomColor {
  var _random;

  /// For testing (and other) purposes, takes an optional [seed] argument to
  /// initialize a [Random] number generator with.
  RandomColor({int? seed}) {
    if (seed != null) {
      _random = Random(seed);
    } else {
      _random = Random();
    }
  }

  static const _upperBound = 0x1000000; // So that the 0xffffff gets included.

  /// Returns a random [Color] from a 24-bit palette, with 100% opacity.
  Color randomColor() => Color(_random.nextInt(_upperBound)).withAlpha(0xff);

  /// Returns a random [MaterialColor] from a list of primary Material colors.
  MaterialColor randomMaterialColor() =>
      Colors.primaries[_random.nextInt(Colors.primaries.length)];
}
