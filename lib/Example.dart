import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(Exampleno1());

class Exampleno1 extends StatelessWidget {

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      icon: Icons.mic,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: Colors.green[900],
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: Icon(Icons.lock, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('Pressed Read Later'),
        ),
      ],
    );
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Geeks for Geeks'),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: Center(
            child: Text(
              'Welcome to GFG!',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        floatingActionButton: buildSpeedDial(),
      ),
    );
  }
}