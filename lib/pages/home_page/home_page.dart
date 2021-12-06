import 'package:flutter/material.dart';
import 'package:oceans_task/models/response.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Response? va;
    return const Scaffold(
      body: SafeArea(child: Center(child:  Text('Hi ')),),
      
    );
  }
}