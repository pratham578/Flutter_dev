import 'package:flutter/material.dart';
import 'package:ted_app/Screens/GreetApp.dart';
import 'package:ted_app/Screens/ted.dart';
import 'package:ted_app/Screens/ted2.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData.dark(),
    title: 'tedApp',
    home: Ted2(),
  ));
}