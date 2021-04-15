import 'package:calculator_app/widgets/icon_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircledButton extends StatelessWidget {

  final Function onTap;
  final IconData sign;

  CircledButton({this.sign, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(30),
      ),
      child: RawMaterialButton(
        onPressed: onTap,
        child: Icon(
          sign,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}