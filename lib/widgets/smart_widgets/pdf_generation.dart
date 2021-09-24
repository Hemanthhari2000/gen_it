import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;

Future<Uint8List> buildPdf(PdfPageFormat format) async {
  final pw.Document doc = pw.Document();
  // final imageSvg = await rootBundle.loadString('assets/college.svg');
  final bannerImage = pw.MemoryImage(
    (await rootBundle.load('images/college_banner.png')).buffer.asUint8List(),
  );
  final profileImage = pw.MemoryImage(
    (await rootBundle.load('images/logo.png')).buffer.asUint8List(),
  );
  // ignore: prefer_const_constructors
  // final networkImage = pw.DecorationImage(
  //     image: Image.network(
  //   "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png",
  // ));

  doc.addPage(
    pw.MultiPage(
      build: (pw.Context context) => [
        pw.Image(bannerImage),
        pw.GridView(
          crossAxisCount: 5,
          childAspectRatio: 1,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 10.0,
          children: [
            for (var i = 0; i <= 14; i++)
              pw.Column(
                children: <pw.Widget>[
                  pw.Container(
                    height: 80,
                    width: 50,
                    child: pw.Image(profileImage),
                  ),
                  // Displaypanel(kNames[i],kNo[i],kComp[i],kPack[i]),
                ],
              ),
          ],
        ),
        pw.Container(height: 50),
        pw.Center(
          child: pw.Text('CONGRAGULATIONS STUDENTS!'),
        ),
      ],
    ),
  );

  return await doc.save();
}

printFunction() {
  Printing.layoutPdf(
    onLayout: (PdfPageFormat format) {
      return buildPdf(format);
    },
  );
}
