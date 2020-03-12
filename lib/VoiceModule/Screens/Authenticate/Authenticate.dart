import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_app/Screens/Authenticate/sign_in.dart';

import 'Register.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  int whichPage=0;
  void changePage()
  {
    setState(() {
      whichPage=whichPage^3;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(whichPage==0)
      {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text("DocVoice",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(height: 80,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        whichPage=1;
                      });
                    },
                    icon: Icon(Icons.person),
                    label: Text("SignIn")),
              ),
              SizedBox(width: 40.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        whichPage=2;
                      });
                    },
                    icon: Icon(Icons.person_add),
                    label: Text("Register")),
              ),
            ],
          )
        ],
      ),
    );
  }
    else if(whichPage==1)
      {
        return SignIn(changePage);
      }
    else if(whichPage==2)
      {
        return Register(changePage);
      }
  }
}
