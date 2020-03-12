import 'package:flutter/material.dart';
import 'package:sih_app_2/screens/home/patient.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:sih_app_2/shared/constants.dart';

class Guided extends StatefulWidget {
  @override
  _GuidedState createState() => _GuidedState();
}

class _GuidedState extends State<Guided> {

    SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

 
  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      appBar: AppBar(
        title: Text("Guided Pre"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.mic),
            onPressed: () {
                    if (_isAvailable && !_isListening)
                      _speechRecognition
                          .listen(locale: "en_IN")
                          .then((result) => print('$result'));
                  },
          ),
          IconButton(
            icon: Icon(Icons.stop),
            onPressed: () {
                    if (_isListening)
                      _speechRecognition.stop().then(
                            (result) => setState(() => _isListening = result),
                          );
                  },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                      heroTag: "btn2",
                  child: Text("Add prescription"),
                  onPressed: () {
                    Navigator.of(context).push(
                   MaterialPageRoute(
                     builder : ( BuildContext context ) => Patient())) ;
                    
                  },
                  backgroundColor: Colors.deepPurple[200],
                ),
                
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 100.0,
                horizontal: 12.0,
              ),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
      
    ); 
  }
}

