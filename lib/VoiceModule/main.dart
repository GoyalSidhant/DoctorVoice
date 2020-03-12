import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_app/Services/auth.dart';

import 'Models/User.dart';
import 'Screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  AuthService _auth=AuthService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: _auth.user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


