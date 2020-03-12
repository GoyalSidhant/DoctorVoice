
import 'package:flutter/material.dart';
import 'package:sih_app_2/models/medicine.dart';
import 'package:sih_app_2/services/listService.dart';
import 'package:sih_app_2/shared/constants.dart';

class AddNewMed extends StatefulWidget {
  final Function changePage;
  final String transcription;

  AddNewMed({this.transcription,this.changePage});

  @override
  _AddNewMedState createState() => _AddNewMedState();
}

class _AddNewMedState extends State<AddNewMed> {
  var text1=TextEditingController();

  var text2=TextEditingController();

  var  text3=TextEditingController();


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
    if(widget.transcription.length>5) {
      if (widget.transcription.substring(0, 5) == "power") {
        setState(() {
          text2 =
              TextEditingController(text: widget.transcription.substring(6));
        });
      }
    }
    if(widget.transcription.length>6) {
      if (widget.transcription.substring(0, 6) == "dosage") {
        setState(() {
          text3 =
              TextEditingController(text: widget.transcription.substring(7));
        });
      }
    }
    try{
      if(widget.transcription=="done")
        {
          String name=text1.text;
          int power=int.parse(text2.text);
          String dosage=text3.text;
          medicines.add(Medicine(name: name,dosage: dosage,power: power));
          widget.changePage(0,"null");
        }
    }

    catch(err){
      print(err.toString());
    }
    try{
      if(widget.transcription=="back")
      {
          widget.changePage(0,"null");
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
              child: Text("Medicine Detail",
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
              decoration:  textFormDecoration.copyWith(hintText: 'Power'),
              controller: text2,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: textFormDecoration.copyWith(hintText: 'Dosage'),
              controller: text3,
            ),
            SizedBox(
              height: 30,
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
          String name=text1.text;
          int power=int.parse(text2.text);
          String dosage=text3.text;
          medicines.add(Medicine(name: name,dosage: dosage,power: power));
            widget.changePage(0,"null");
        },
      ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}