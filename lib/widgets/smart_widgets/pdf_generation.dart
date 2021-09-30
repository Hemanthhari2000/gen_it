import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:gen_it/core/models/student_model.dart';
import 'package:gen_it/theme/constants.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generatePdf(
  PdfPageFormat format,
  List<Student> placedStudents,
) async {
  final pdf = pw.Document();

  final bannerImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/college_banner.png'))
        .buffer
        .asUint8List(),
  );

  final List imgs = [];

  for (var i = 0; i < placedStudents.length; i++) {
    var imgURL = placedStudents[i].imageURL;
    final netImage = await networkImage(imgURL);
    imgs.add(netImage);
  }

  // pdf.addPage(
  //   pw.Page(
  //     pageFormat: format,
  //     build: (context) {
  //       return pw.Column(
  //         children: [
  //           pw.Image(bannerImage),
  //           pw.SizedBox(height: 50),
  //           // pw.Wrap(
  //           //   crossAxisAlignment: pw.WrapCrossAlignment.center,
  //           //   spacing: 40,
  //           //   children: [
  //           //     for (var i = 0; i < placedStudents.length; i++)
  //           //       pw.Container(
  //           //         child: pw.Column(
  //           //           children: [
  //           //             pw.Image(imgs[i], width: 80, height: 100),
  //           //             pw.SizedBox(height: 5),
  //           //             pw.Text(placedStudents[i].regno),
  //           //             pw.Text(placedStudents[i].name),
  //           //             pw.Text(placedStudents[i].company),
  //           //             pw.Text('${placedStudents[i].package} LPA'),
  //           //             pw.SizedBox(height: 10),
  //           //           ],
  //           //         ),
  //           //       ),
  //           //   ],
  //           // ),

  //           pw.GridView(
  //             crossAxisCount: 5,
  //             crossAxisSpacing: 1,
  //             childAspectRatio: 1.4,
  //             children: [
  //               for (var i = 0; i < placedStudents.length; i++)
  //                 pw.Column(
  //                   children: [
  //                     pw.Image(imgs[i], width: 80, height: 100),
  //                     pw.SizedBox(height: 5),
  //                     pw.Text(placedStudents[i].regno),
  //                     pw.Text(placedStudents[i].name),
  //                     pw.Text(placedStudents[i].company),
  //                     pw.Text('${placedStudents[i].package} LPA'),
  //                     pw.SizedBox(height: 10),
  //                   ],
  //                 ),
  //             ],
  //           ),

  //           pw.Container(height: 50),
  //           pw.Center(
  //             child: pw.Text('** CONGRAGULATIONS STUDENTS! **',
  //                 style:
  //                     const pw.TextStyle(color: PdfColor.fromInt(0xFFE50914))),
  //           ),
  //         ],
  //       );
  //     },
  //   ),
  // );

  pdf.addPage(
    pw.MultiPage(
      pageFormat: format,
      build: (pw.Context context) => [
        // pw.Image(bannerImage),
        pw.Align(
          alignment: pw.Alignment.topCenter,
          child: pw.Image(bannerImage),
        ),
        pw.SizedBox(height: 30),
        pw.GridView(
          crossAxisCount: 5,
          crossAxisSpacing: 1,
          childAspectRatio: 1.4,
          children: [
            for (var i = 0; i < placedStudents.length; i++)
              pw.Column(children: [
                pw.Image(imgs[i], width: 80, height: 100),
                pw.SizedBox(height: 5),
                pw.Text(placedStudents[i].regno),
                pw.Text(placedStudents[i].name),
                pw.Text(placedStudents[i].company),
                pw.Text('${placedStudents[i].package} LPA'),
                pw.SizedBox(height: 10),
              ]),
          ],
        ),
      ],
    ),
  );

  return pdf.save();
}

printFunction(placedStudents) {
  Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async {
      // return buildPdf(format, placedStudents);
      return await generatePdf(format, placedStudents);
    },
  );
}
