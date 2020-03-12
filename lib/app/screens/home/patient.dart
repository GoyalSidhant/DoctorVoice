import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_app_2/shared/constants.dart';
class Patient extends StatefulWidget {
  final Function changePage;
  final String transcription;

  Patient({this.transcription,this.changePage});

  @override
  _Patient createState() => _Patient();
}

class _Patient extends State<Patient> {
  var text1=TextEditingController();

  var text2=TextEditingController();

  var  text3=TextEditingController();

  var text4=TextEditingController();

  @override
  Widget build(BuildContext context) {
      if(widget.transcription.length>4) {
        if (widget.transcription.substring(0, 4) == "name") {
          setState(() {
            text1 =
                TextEditingController(text: widget.transcription.substring(5));
          });
        }
      }
      if(widget.transcription.length>3) {
        if (widget.transcription.substring(0, 3) == "age") {
          setState(() {
            text2 =
                TextEditingController(text: widget.transcription.substring(4));
          });
        }
      }
      if(widget.transcription.length>3) {
        if (widget.transcription.substring(0, 3) == "sex") {
          setState(() {
            text3 =
                TextEditingController(text: widget.transcription.substring(4));
          });
        }
      }
      if(widget.transcription.length>7) {
        if (widget.transcription.substring(0, 7) == "ailment") {
          setState(() {
            text4 =
                TextEditingController(text: widget.transcription.substring(8));
          });
        }
      }
      try {
        if (widget.transcription == "done") {
          Future.delayed(Duration(seconds: 2)).then(
              widget.changePage(0, "null"));
        }
      }
      catch(err){
        print(err.toString());
      }
    return Scaffold(
      body: Container(
        color: Colors.tealAccent,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text("Patient Detail",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: textFormDecoration.copyWith(hintText: 'Name' ),
              controller: text1,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration:  textFormDecoration.copyWith(hintText: 'Age'),
              controller: text2,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: textFormDecoration.copyWith(hintText: 'Sex'),
              controller: text3,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: textFormDecoration.copyWith(hintText: 'Ailment'),
              controller: text4,
            ),
          ],
        ),
      ),
        floatingActionButton: Container(
        width: 100,
        child: FloatingActionButton(
        child: Text("Done",
        style: TextStyle(
            color: Colors.black,
         ),),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((10.0)),
      ),
    materialTapTargetSize: MaterialTapTargetSize.padded,
        onPressed: () {
          widget.changePage(0,"null");
        },
    )
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}