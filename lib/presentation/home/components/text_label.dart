import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String content;
  final double? fontSize;
  final FontWeight? fontWeight;

  const TextLabel(
      {Key? key,
      required this.content,
      this.fontSize = 20,
      this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight));
  }
}
