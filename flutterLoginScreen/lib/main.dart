import 'package:flutter/material.dart';
import 'package:ted_app/Screens/GreetApp.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData.dark(),
    title: 'tedApp',
    home: GreetApp(),
  ));
}