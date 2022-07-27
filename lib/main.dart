import 'package:flutter/material.dart';
import 'package:webview/fragment.dart';
import 'package:webview/webview.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
theme: ThemeData(
  primaryColor: Colors.red,accentColor: Colors.red
),
    debugShowCheckedModeBanner: false,

      home: fragment());
  }
}




