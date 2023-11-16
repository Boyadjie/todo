import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class FormInputText extends StatefulWidget {
  final String inputLabel;
  final double inputFontSize;
  final FontWeight inputFontWeight;
  final EdgeInsets padding;
  final String? Function(String? value) validate;
  final Widget? counter;
  final TextEditingController? controller;
  final bool obscureText;

  const FormInputText({
    Key? key,
    required this.inputLabel,
    required this.validate,
    this.inputFontSize = 12,
    this.inputFontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.counter,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<FormInputText> createState() => _FormInputTextState();
}

class _FormInputTextState extends State<FormInputText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.inputLabel,style: TextStyle(
              color: CustomColorsLight.textBlack,
              fontWeight: widget.inputFontWeight,
              fontSize: widget.inputFontSize,
            ),),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: widget.obscureText,
              controller: widget.controller,
              style: TextStyle(
                fontSize: widget.inputFontSize,
              ),
              cursorColor: CustomColorsLight.textBlack,
              decoration: InputDecoration(
                enabled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                counter: widget.counter
              ),
              // The validator receives the text that the user has entered.
              validator: widget.validate,
            ),
          ],
        )
    );
  }
}
