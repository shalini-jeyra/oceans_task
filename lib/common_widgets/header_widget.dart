import 'package:flutter/material.dart';
import 'package:oceans_task/styles/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,required this.text
  }) : super(key: key);
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
      color: AppColors.ternary,
     
      borderRadius:BoxBorders.secondaryBoxBorder,
    ),
       
       child:  Center(child: Text(text,style: TextFonts.primaryText,)),
    );
  }
}