

import 'package:flutter/material.dart';
import 'package:oceans_task/styles/styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.text,
    required this.controller,
    required this.validatorText
  }) : super(key: key);
  final String text;
  final String validatorText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:32.0,right: 32,top: 10),
      child: TextFormField(
        controller: controller,
        style: TextFonts.ternaryText,
        decoration: InputDecoration(
          
          filled: true,
          fillColor: HintColors.primary,
          hintText: text,
          hintStyle: HintText.primaryText,
          contentPadding: const EdgeInsets.all(24),
          focusedBorder: const OutlineInputBorder(
            borderSide:  BorderSide(color: HintColors.primary),
            borderRadius: BoxBorders.primaryBoxBorder,
            gapPadding: 50.0,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BoxBorders.primaryBoxBorder,
          ),
        ),
        validator: (value)
                      {
                        if(value!.isEmpty )
                        {
                          return validatorText;

                        }
                        return null;
                      },
      ),
    );
  }
}
