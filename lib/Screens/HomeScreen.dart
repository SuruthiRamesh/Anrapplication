import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key = const Key("any key")}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp',style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
          actions: [
            IconButton(icon: Icon(Icons.search),onPressed: (){}),
            PopupMenuButton(onSelected:(value){
              print(value);
              },
                itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text('New group'),value: 'New group',),
                PopupMenuItem(child: Text('New broadcast'),value: 'New broadcast',),
                PopupMenuItem(child: Text('WhatsApp Web'),value: 'Whatsapp Web',),
                PopupMenuItem(child: Text('Starred Messages'),value: 'Starred Messages',),
                PopupMenuItem(child: Text('Payments'),value: 'Payments',),
                PopupMenuItem(child: Text('Settings'),value: 'Settings',)
              ];
            }),
          ],
          bottom: TabBar(
              tabs: [
            Tab(icon:Icon(Icons.camera_alt)),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS')
          ]),
        ),
      ),
    );
  }
}



