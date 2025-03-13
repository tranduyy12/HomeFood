import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  final String fontFamily;

  BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
    this.fontFamily = 'Roboto',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        fontSize: size,
      ),
    );
  }
}
