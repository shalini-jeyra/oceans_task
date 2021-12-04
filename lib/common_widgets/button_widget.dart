import 'package:flutter/material.dart';
import 'package:oceans_task/styles/styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.onPressed,required this.text}) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: ButtonBorders.primaryBoxBorder,
        ),
        primary: AppColors.ternary,
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
      ),
      child: Text(
        text,
        style: TextFonts.primaryText,
      ),
      onPressed: onPressed,
    );
  }
}
