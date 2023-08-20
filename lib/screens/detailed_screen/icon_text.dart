import 'package:flutter/material.dart';
import 'package:foodapp/screens/shared_txt_widget.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final SharedText text;
  final Color color;
  const IconText({super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: color,),
        const SizedBox(
          width: 5,
        ),
        text
      ],
    );
  }
}
