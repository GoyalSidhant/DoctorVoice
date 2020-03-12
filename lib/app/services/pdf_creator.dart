import 'dart:io';
import 'dart:typed_data';
//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<String> pdfGenerator(String name,String type,String phoneNo,String address) async {
  final Document pdf = Document();
  final data = await rootBundle.load("assets/OpenSans-Regular.ttf");
  var myFont =Font.ttf(data);
  var myStyle=TextStyle(font:myFont);
  pdf.addPage(
//      Page(
//          pageFormat: PdfPageFormat.a4,
//          build: (Context context) {
//            return Center(
//              child: Text("Hello World",style: myStyle),
//            ); // Center
//          })
      MultiPage(
      pageFormat:
      PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(
                border:
                BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Portable Document Format',
                style: myStyle
            ));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: myStyle
            ));
      },
      build: (Context context) => <Widget>[
      Header(
      level: 0,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('$name', textScaleFactor: 3,
                style: myStyle
            ),
          ]
      ),
      ),
           Header(
            level: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('$type', textScaleFactor: 2,style: myStyle),
                  Text('ph: $phoneNo',textScaleFactor: 2,
                      style: myStyle
                  ),
//                  Text('22-08-1998',textScaleFactor: 2,style: myStyle),
                ]
            ),
      ),
      Table.fromTextArray(context: context, data: const <List<String>>[
        <String>['Patient Name', 'Age', 'Sex','Ailment'],
        <String>['', '', '',''],
        ])
  ]
  )
  );
  try{
    final String dir = (await getTemporaryDirectory()).path;
    final String path='$dir/example.pdf';
    final File file = File(path);
    file.writeAsBytesSync(pdf.save());
    return path;
  }
  catch(err){
    print(err.toString());
  }

}