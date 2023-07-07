import 'package:flutter/material.dart';
class UIText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  const UIText({Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 14,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight
      ),
      textAlign: textAlign,
    );
  }
}
