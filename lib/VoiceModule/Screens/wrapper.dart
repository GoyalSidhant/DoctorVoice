import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_app/Models/User.dart';
import 'package:sih_app/Screens/Authenticate/sign_in.dart';
import 'Authenticate/Authenticate.dart';
import 'Home/Home.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user=Provider.of<User>(context);
    print(user);
    //Either return home or authenticate
    if(user==null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}

