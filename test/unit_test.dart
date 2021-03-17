import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:test_task/util/color_utils.dart';
import 'package:test_task/util/random_color.dart';

void main() {
  group('ColorUtils |', () {
    test('The hex code of Color(0xffabcdef) is \'#ABCDEF\'', () {
      expect(Color(0xffabcdef).toHex(), '#ABCDEF');
    });

    test('The contrasting color of Colors.black is Colors.white', () {
      expect(Colors.black.contrastingColor, Colors.white);
    });

    test('The contrasting color of Colors.white is Colors.black', () {
      expect(Colors.white.contrastingColor, Colors.black);
    });
  });

  group('RandomColor |', () {
    final _seededColorGenerator = RandomColor(seed: 42);

    test('randomColor() returns Color(0xff9a8c33) when seed is 42', () {
      expect(_seededColorGenerator.randomColor(), Color(0xff9a8c33));
    });

    test('randomMaterialColor() returns Colors.lightBlue when seed is 42', () {
      expect(_seededColorGenerator.randomMaterialColor(), Colors.lightBlue);
    });
  });
}
