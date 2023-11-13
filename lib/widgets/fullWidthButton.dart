import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class FullWidthButton extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
  final double buttonFontSize;
  final double buttonHeight;
  final Function() onPressed;

  const FullWidthButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonFontSize = 35,
    this.buttonHeight = 70,
    this.backgroundColor = CustomColorsLight.orange,
    this.textColor = CustomColorsLight.textWhite,
  }) : super(key: key);

  @override
  State<FullWidthButton> createState() => _FullWidthButtonState();
}

class _FullWidthButtonState extends State<FullWidthButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        minimumSize: Size.fromHeight(widget.buttonHeight),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.buttonText,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.buttonFontSize,
            color: widget.textColor,
        ),
      ),
    );
  }
}
