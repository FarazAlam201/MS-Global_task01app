import 'package:flutter/material.dart';
import 'package:task1_app/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? fontcolor;
  final double btnheight;
  final double btnwidth;
  final double borderRadius;
  final double topMargin;
  final double leftMargin;
  final double rightMargin;
  final double bottomMargin;
  final VoidCallback? callback;
  CustomButton({
    super.key,
    required this.text,
    required this.callback,
    this.borderRadius = 25,
    this.fontcolor,
    this.btnheight = 48,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.btnwidth = double.infinity,
    Color? btncolor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: transparent,
      highlightColor: transparent,
      onTap: callback,
      child: Container(
          margin: EdgeInsets.only(
              top: topMargin,
              bottom: bottomMargin,
              left: leftMargin,
              right: rightMargin),
          height: btnheight,
          width: btnwidth,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
              child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ))),
    );
  }
}
