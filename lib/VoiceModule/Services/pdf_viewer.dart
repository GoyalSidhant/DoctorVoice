import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PdfViewer extends StatefulWidget {
  final String path;
  final Function changePage;
  final String transcription;
  PdfViewer({this.path,this.changePage,this.transcription});

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  int status=0;
  @override
  Widget build(BuildContext context) {
    try {
      if (widget.transcription == "back") {
        widget.changePage(0);
      }
    }
    catch(err){
      print(err.toString());
    }
      if (widget.transcription == "mail" && status==0) {
          final Email email = Email(
            body: 'Prescripion',
            subject: 'Your Medical Prescription',
            recipients: ['someone@gmail.com'],
            attachmentPath: widget.path,
            isHTML: false,
          );
         FlutterEmailSender.send(email);
         status=1;
      }
    return Container(
            child: PDFViewerScaffold(
              appBar: AppBar(
                centerTitle: true,
              title: Text("Preview Prescription"),
              backgroundColor: Colors.tealAccent,
              actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.mail,
                  color: Colors.black,),
                onPressed: () async  {
                    print(widget.path);
                 try{
                   final Email email = Email(
                     body: 'Prescripion',
                     subject: 'the Email Subject',
                     recipients: ['rohansharmagarwal@gmail.com'],
                     attachmentPath: widget.path,
                     isHTML: false,
                   );
                    FlutterEmailSender.send(email);
                 }
                 catch(err) {
                   print(err.toString());
                 }
                }, ),
              ],
            ),
            path: widget.path,
        ),
    );
  }
}
