import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefualTextOne extends StatelessWidget {
  final String text;
  final Color color;
  double? textSize = 22;
  DefualTextOne({
    required this.text,
    required this.color,
    this.textSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color, fontSize: textSize, fontWeight: FontWeight.w400));
  }
}
