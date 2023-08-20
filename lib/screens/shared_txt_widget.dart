import 'package:flutter/material.dart';

class SharedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  const SharedText({super.key, required this.color, required this.size,this.fontWeight=FontWeight.normal, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: text.length>20 ? TextOverflow.ellipsis:null,
        color: color,
        fontSize: size,
        fontWeight: fontWeight
      ),
    );
  }
}
