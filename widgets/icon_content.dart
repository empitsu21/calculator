import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconContent extends StatelessWidget {

  final String label;
  final IconData icon;
  final double size;

  IconContent({this.label, this.size, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: size,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}
