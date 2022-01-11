import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final int? selectedIndex;
  final String? text;
  final Color? color;
  final Color? textColor;
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.selectedIndex,
      this.text,
      this.color,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(color: color!),
                borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 800),
            child: Text(
              text!,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
