import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'SIH APP',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.pink[50] : Colors.lime[300]
      ),
      home: LoginPage(),
    );
  }
}
