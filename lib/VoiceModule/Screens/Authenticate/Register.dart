import 'package:flutter/material.dart';
import 'package:sih_app/Services/auth.dart';
import 'package:sih_app/Shared/Loading.dart';
import 'package:sih_app/Shared/constants.dart';
class Register extends StatefulWidget {
  final Function changePage;
  Register(this.changePage);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
          title: Text("SignUp"),
          centerTitle: true,
          backgroundColor: Colors.tealAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
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
                    validator: (val)=>val.length<6?'Enter a Password with 6+ characters':null,
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
                            dynamic user = await _auth.register(
                                email.trim(), password);
                            if (user == null) {
                              setState(() {
                                error = 'Enter a correct Email or Password';
                                isLoading=false;
                              });
                            }
                          }
                        },
                        icon: Icon(Icons.person_add),
                        label: Text("Register")),
                  ),
                  SizedBox(height: 10,),
                  FlatButton(
                    child: Text("Already Have an account??",
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
