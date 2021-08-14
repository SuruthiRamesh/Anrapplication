// @dart=2.9


import 'package:anrapplication/Screens/HomeScreen.dart';
import 'package:anrapplication/Screens/Individualchat.dart';
import 'package:flutter/material.dart';
import 'package:anrapplication/micanimation.dart';
import 'package:anrapplication/MicAnimations1.dart';
import 'package:anrapplication/Example.dart';




void main() {
  runApp((MyApp()
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E)
      ),
      home:MyIndividualApp()

    );
  }
}
