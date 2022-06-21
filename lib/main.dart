import 'package:first_app/homeScreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}