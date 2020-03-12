import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_app/Services/auth.dart';
import 'package:sih_app/Shared/Loading.dart';
import 'package:sih_app/Shared/constants.dart';
class SignIn extends StatefulWidget {
  final Function changePage;
  SignIn(this.changePage);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  bool isLoading=false;
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return isLoading?Loading():Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body:SingleChildScrollView(
        child: Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: textFormDecoration.copyWith(hintText: 'Email'),
                      validator: (val)=>val.isEmpty?'Enter an Email':null,
                      onChanged: (val){
                        setState(() {
                          email=val;
                        });
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      obscureText: true,
                      decoration: textFormDecoration.copyWith(hintText: 'Password'),
                      validator: (val)=>val.isEmpty?'Enter a Password':null,
                      onChanged: (val){
                        setState(() {
                          password=val;
                        });
                      },
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                          color: Colors.tealAccent
                      ),
                      child: FlatButton.icon(
                          onPressed: () async {
                            setState(() {
                              isLoading=true;
                            });
                            if(_formKey.currentState.validate()) {
                              dynamic user = await _auth.signInWithEmailAndPassword(
                                  email.trim(), password);
                              if (user == null) {
                                setState(() {
                                  error = 'Enter a correct Email or Password';
                                  isLoading=false;
                                });
                              }
                            }
                          },
                          icon: Icon(Icons.done),
                          label: Text("Submit")),
                    ),
                    SizedBox(height: 10,),
                    FlatButton(
                      child: Text("New user?",
                      style: TextStyle(
                        color: Colors.tealAccent,
                      ),),
                      onPressed: (){
                        widget.changePage();
                      },
                    ),
                    SizedBox(height: 5,),
                    Text(error,
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),)
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
