import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonBgColor;
  final Color? foregroundColor;
  final double borderRadius;
  final double  elevation;
  final double width;
  final double height;
  final Color? textcolor;
  final double textsize;

  CustomElevatedButton({
    required this.onPressed,
    required this.buttonText,
    this.textsize = 16,
    this.buttonBgColor = Colors.red,
    this.borderRadius = 22,
    this.elevation = 10,
    this.foregroundColor = Colors.white,
    this.height = 44,
    this.width = 160,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText,style: TextStyle(color: textcolor,fontSize: textsize ),),

        style: ElevatedButton.styleFrom(
            backgroundColor: buttonBgColor,
            foregroundColor: foregroundColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))
        ),

      ),
    );
  }
}

Color bgColorGrey = Colors.grey.shade400;
Color bgColorGreen = Colors.green ;