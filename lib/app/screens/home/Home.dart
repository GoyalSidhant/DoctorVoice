import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:sih_app_2/services/pdf_viewer.dart';
import 'package:sih_app_2/screens/add_new_med.dart';
import 'package:sih_app_2/screens/prescription_template.dart';
import 'package:sih_app_2/screens/home/patient.dart';
import 'lists.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String path;
  int page=1;
  void changePage(int p,String tp){
    setState(() {
      page=p;
      if(tp!="null")
        {
          path=tp;
        }
    });
  }
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';
  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }
  void activateSpeechRecognizer() {
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech
        .activate()
        .then((res) => setState(() {
          _speechRecognitionAvailable = res;
          start();
        }));
  }
  Widget build(BuildContext context) {
    start();
    if(transcription=="preview")
      {
        page=2;
      }
    if(transcription=="patient")
    {
        page=3;
    }
    if(transcription=="add")
      {
        page=4;
      }

    return page==1?PrescriptionFormat(transcription: transcription ,changePage: changePage):page==2?PdfViewer(path: path,transcription: transcription,changePage: changePage,):page==3?Patient(transcription: transcription ,changePage: changePage):page==4?AddNewMed(transcription: transcription ,changePage: changePage):Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Lists(),
      floatingActionButton: Stack(
        children: <Widget>[Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 100,
            child: FloatingActionButton(
              child: Text("Preview",
                style: TextStyle(
                  color: Colors.black,
                ),),
              backgroundColor: Colors.tealAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular((10.0)),
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onPressed: (){
                     setState(() {
                       page=2;
                     });
              },
            ),
          ),
        ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.mic),
              onPressed: (){
                setState(() {
                  start();
                });
              },
            ),
          )
      ]
      ),
    );
  }

  
  void start() => _speech
      .listen(locale: 'en_IN');

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() => _speech.stop().then((result) {
    setState(() => _isListening = result);
  });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);
  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() {
    transcription = text;
  }
  );

  void onRecognitionComplete() => setState(() => _isListening = false);
}