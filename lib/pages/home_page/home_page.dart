import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({ Key? key, required this.name }) : super(key: key);
final String name; 
  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      body: SafeArea(child: Center(child:  Text('Hi $name ')),),
      
    );
  }
}