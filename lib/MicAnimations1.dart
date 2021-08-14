import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter_speed_dial_material_design/flutter_speed_dial_material_design.dart';

class MicAnimation1 extends StatefulWidget {
  const MicAnimation1({Key key = const Key("any key")}) : super(key: key);

  @override
  _MicAnimation1State createState() => _MicAnimation1State();
}

class _MicAnimation1State extends State<MicAnimation1>  with TickerProviderStateMixin {
  double position=0.0;
  var top = 10.0;
  var left = 10.0;
  bool _showAudioControls=true;
  var _micSize=0.0;
  var _micMaxSize=0.0;
  bool _startRecording=true;

  SpeedDialController _controller = SpeedDialController();
  final icons = [
    SpeedDialAction(
      child: Icon(Icons.lock,size: 30,),
    )
  ];
  _onSpeedDialAction(int selectedActionIndex) {
    print('$selectedActionIndex Selected');
  }

  final roundedContainer = ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          SizedBox(width: 8.0),
          Icon(Icons.insert_emoticon,
              size: 30.0),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.attach_file,
              size: 30.0),
          SizedBox(width: 8.0),
          Icon(Icons.camera_alt,
              size: 30.0),
          SizedBox(width: 8.0),
        ],
      ),
    ),
  );
  _showdialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return GestureDetector(
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
              vsync: this,duration: Duration(milliseconds: 150),
              curve: Curves.fastOutSlowIn,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),
                child: Icon(Icons.lock,size: 30),
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          leadingWidth: 70,
          leading: Row(
            children: [
              Icon(Icons.arrow_back,size: 24),
              CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/bts1.jpg')
              )
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('6385873909',style:TextStyle(fontWeight: FontWeight.bold)),
              Text('online',style:TextStyle(fontSize: 13))
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.videocam,color: Colors.white,),onPressed: null,),
            IconButton(icon: Icon(Icons.call,color: Colors.white,),onPressed: null,),
            PopupMenuButton(
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(child: Text('Add to contacts')),
                  PopupMenuItem(child: Text('Media, links, and docs')),
                  PopupMenuItem(child: Text('Search')),
                  PopupMenuItem(child: Text('Mute notifications')),
                  PopupMenuItem(child: Text('Wallpaper')),
                  PopupMenuItem(child: Text('More'))
                ];
              },
            )
          ],
        ),
        body: Container(

          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width - 65,
                        child: Card(
                            margin: EdgeInsets.only(left: 7,right:1,bottom:8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28)
                            ),
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.attach_file),onPressed: (){},),
                                      IconButton(icon: Icon(Icons.camera_alt),onPressed: (){},)
                                    ],
                                  ),
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.emoji_emotions_outlined,size: 30),
                                    onPressed: (){},
                                  ),
                                  contentPadding: EdgeInsets.all(10)
                              ),
                            ))),

                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.mic),
          backgroundColor: Color(0xFF075E54),
          onPressed: (){
            return _showdialog(context);
          },
        )
    );
  }
}
