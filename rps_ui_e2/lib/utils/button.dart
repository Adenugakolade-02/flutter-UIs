import 'package:flutter/material.dart';
import 'package:rps_ui_e2/utils/constants.dart';

class SquareIconButton extends StatelessWidget {
  final Function() onPressed;
  final Color iconColor, buttonColor;
  final double width;
  final IconData icon;
  final double borderRadius;
  final BoxShape boxShape;
  final bool circle;

  const SquareIconButton({Key? key, required this.onPressed, this.iconColor = COLOR_GREEN, this.buttonColor = Colors.white, required this.width , required this.icon, this.borderRadius = 10,required this.boxShape,required this.circle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: width,
        child: Icon(
          this.icon,
          color: iconColor,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius:circle? null : BorderRadius.circular(borderRadius),
          shape: this.boxShape
        ),
      ),
    );
  }
}
