import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               musicKey(Colors.red,1),
               musicKey(Colors.orange,2),
               musicKey(Colors.yellowAccent,3),
               musicKey(Colors.green,4),
               musicKey(Colors.teal,5),
               musicKey(Colors.blue,6),
               musicKey(Colors.lightBlueAccent,7),
             ],

        ),
      ),
      ),
    );
  }
   Widget musicKey(Color colors,int keyNumber){
    return Expanded(
      child:FlatButton(
      color: colors,
      onPressed: (){
        final player = AudioCache();
        player.play('note$keyNumber.wav');
      },
      ),
    );
   }
}

