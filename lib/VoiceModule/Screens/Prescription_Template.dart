import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_app/Services/pdf_creator.dart';
import 'package:sih_app/Shared/constants.dart';
import 'package:sih_app/Shared/pdf_Constants.dart';
class PrescriptionFormat extends StatefulWidget {
  final Function changePage;
  final String transcription;

  PrescriptionFormat({this.transcription,this.changePage});

  @override
  _PrescriptionFormatState createState() => _PrescriptionFormatState();
}

class _PrescriptionFormatState extends State<PrescriptionFormat> {
  var text1=TextEditingController();

  var text2=TextEditingController();

  var  text3=TextEditingController();

  var text4=TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(widget.transcription.length>8) {
      if (widget.transcription.substring(0, 7) == "address") {
        setState(() {
          text4 =
              TextEditingController(text: widget.transcription.substring(8));
        });
      }
    }
    if(widget.transcription.length>15) {
      if (widget.transcription.substring(0, 11) == "doctor name") {
        setState(() {
          text1 =
              TextEditingController(text: widget.transcription.substring(12));
        });
      }
      else if (widget.transcription.substring(0, 11) == "doctor type") {
        setState(() {
          text2 =
              TextEditingController(text: widget.transcription.substring(12));
        });
      }
      else if (widget.transcription.substring(0, 12) == "phone number") {
        setState(() {
          text3 =
              TextEditingController(text: widget.transcription.substring(13));
        });
      }
    }
    try {
      if (widget.transcription == "done") {
        setDocName(text1.text);
        setDocType(text2.text);
        setDocPhoneNo(text3.text);
        setDocAddress(text4.text);
        widget.changePage(0);
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
                  child: Text("Doctor Details",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(
                  height: 30,
                ),
                    TextFormField(
                    decoration: textFormDecoration.copyWith(hintText: 'Doctor Name' ),
                      controller: text1,
                  ),
                SizedBox(
                  height: 30,
                ),
                   TextFormField(
                    decoration:  textFormDecoration.copyWith(hintText: 'Doctor Type'),
                     controller: text2,
                  ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: textFormDecoration.copyWith(hintText: 'Phone Number'),
                  controller: text3,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: textFormDecoration.copyWith(hintText: 'Address'),
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
        onPressed: () async {
          setDocName(text1.text);
          setDocType(text2.text);
          setDocPhoneNo(text3.text);
          setDocAddress(text4.text);
          widget.changePage(0);
        },
      ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
