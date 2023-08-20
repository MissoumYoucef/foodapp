import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {
  final IconData icon;
  const TopIcon({super.key, required this.icon,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Icon(
          icon,
          size: 24,       
        ),
      ),
    );
  }
}
