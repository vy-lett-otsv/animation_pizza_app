import 'package:flutter/material.dart';

class UIColors {
  UIColors._();

  static final Color background = HexColor.fromHex('#303D48');
  static final Color backgroundBold = HexColor.fromHex('#2f3542');
  static final Color grey = HexColor.fromHex('#7f8fa6');
  static final Color orange = HexColor.fromHex('#F56B13');
  static final Color backgroundSecond = HexColor.fromHex('#24333C');
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    Color color = Colors.black;
    try {
      color = Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      print(e);
    }
    return color;
  }
}
