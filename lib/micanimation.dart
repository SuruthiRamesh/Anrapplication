import 'package:flutter/material.dart';

class MicAnimation extends StatefulWidget {
  const MicAnimation({Key key = const Key("any key")}) : super(key: key);

  @override
  _MicAnimationState createState() => _MicAnimationState();
}

class _MicAnimationState extends State<MicAnimation> with SingleTickerProviderStateMixin {

  var top = 10.0;
  var left = 10.0;
  bool _showAudioControls=true;
  var _micSize=0.0;
  var _micMaxSize=0.0;
  bool _startRecording=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello')
      ),
      body: GestureDetector(

        onLongPressEnd: (LongPressEndDetails d) {
          setState(() {
            _showAudioControls = false;
            _micSize = 24.0;
            _startRecording = false;
          });
        },
        onLongPress: () {
          setState(() {

            _showAudioControls = true;
            _micSize = _micMaxSize;
            _startRecording = true;
          });
        },
        child: AnimatedSize(
          vsync:this,
          duration: Duration(milliseconds: 150),
          curve: Curves.fastOutSlowIn,
          child: Container(
            width: _micSize == 44 ? 60 : 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Icon(
              Icons.send,
              size: _micSize, //34
            ),
          ),
        ),
      )
    );
  }
}
