import 'dart:io';
import 'dart:typed_data';
//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:sih_app/Services/listService.dart';
import 'package:sih_app/Shared/pdf_Constants.dart';
var myStyle;
Future<String> pdfGenerator() async {
  final Document pdf = Document();
  final data = await rootBundle.load("assets/OpenSans-Regular.ttf");
  var myFont =Font.ttf(data);
   myStyle=TextStyle(font:myFont);
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
      build: (Context context) => Tablemedicine(context)
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
List<Widget> Tablemedicine(context){
  List renderPdf=new List<Widget>();
  renderPdf.add(Header(
    level: 0,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(doctorName, textScaleFactor: 3,
              style: myStyle
          ),
        ]
    ),
  ));
  renderPdf.add(Header(
    level: 0,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(doctorType, textScaleFactor: 2,style: myStyle),
          Text('ph: $doctorPhoneNo',textScaleFactor: 2,
              style: myStyle
          ),
//                  Text('22-08-1998',textScaleFactor: 2,style: myStyle),
        ]
    ),
  ));
  renderPdf.add(Table.fromTextArray(context: context, data:  <List<String>>[
    <String>['Patient Name', 'Age', 'Sex','Ailment'],
    <String>[patientName,patientAge,patientSex,patientAilment],
  ]));
  renderPdf.add(Header(
    level: 0,
    text: '',
      decoration: BoxDecoration(
          border: BoxBorder(
            bottom: false,
          )
      )
  ));
  for(int i=0;i<medicines.length;i++) {
    renderPdf.add(Table.fromTextArray(context: context, data: <List<String>>[
    <String>['                   MEDICINE $i']]));
     renderPdf.add(Table.fromTextArray(context: context, data: <List<String>>[
      <String>['Name', 'Power', 'Dosage'],
      <String>[medicines[i].name, medicines[i].power.toString(), medicines[i].dosage],
    ]));
    renderPdf.add(Header(
      level: 1,
      text: '',
      decoration: BoxDecoration(
        border: BoxBorder(
          bottom: false,
        )
      )
    ));
  }
  return renderPdf;
}