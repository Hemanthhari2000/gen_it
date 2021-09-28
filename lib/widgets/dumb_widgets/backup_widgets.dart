





// ************************ pdf_generation  BACKUP CODE **************************



// Future<Uint8List> buildPdf(
//     PdfPageFormat format, List<Student> placedStudents) async {
//   final pw.Document doc = pw.Document();
//   final imageSvg = await rootBundle.loadString('assets/college.svg');
//   final bannerImage = pw.MemoryImage(
//     (await rootBundle.load('assets/images/college_banner.png'))
//         .buffer
//         .asUint8List(),
//   );
//   const url =
//       "https://firebasestorage.googleapis.com/v0/b/gen-it.appspot.com/o/students%2F4059.jpg?alt=media&token=05c365d4-0a63-40e5-98e0-bd22f129b1cc";

//   final img = await networkImage(
//       "https://firebasestorage.googleapis.com/v0/b/gen-it.appspot.com/o/students%2F4043.jpg?alt=media&token=27d728d2-598c-49c3-a599-723de2642b15");

//   final img2 = await networkImage(url);

//   final profileImage = pw.MemoryImage(
//     (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
//   );
//   ignore: prefer_const_constructors
//   final networkImage = pw.DecorationImage(
//       image: Image.network(
//     "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png",
//   ));

//   doc.addPage(
//     pw.MultiPage(
//       pageFormat: format.portrait,
//       build: (pw.Context context) => [
//         pw.Image(bannerImage),
//         pw.Image(img),
//         pw.SizedBox(height: 50),
//         pw.GridView(
//           crossAxisCount: 5,
//           crossAxisSpacing: 1,
//           mainAxisSpacing: 50,
//           childAspectRatio: 1,
//           children: [
//             for (var i = 0; i < 30; i++)
//               for (var i = 0; i < placedStudents.length; i++)
//               pw.Column(
//                 children: [
//                   pw.Image(img, width: 80, height: 100),
//                   pw.Text('Name'),
//                   pw.Text('Name'),
//                   pw.Text('Name'),
//                   pw.Text('Name'),
//                   pw.Text(student.name.toString()),
//                 ],
//               ),
//           ],
//         ),

//         pw.Wrap(
//           crossAxisAlignment: pw.WrapCrossAlignment.center,
//           spacing: 20,
//           children: [
//             for (var i = 0; i < 40; i++)
//               pw.Container(
//                 margin: pw.EdgeInsets.only(
//                   right: 20.0,
//                 ),
//                 child: pw.Column(
//                   children: [
//                     pw.Image(img2, width: 80, height: 100),
//                     pw.SizedBox(height: 5),
//                     pw.Text('Hemanth'),
//                     pw.Text('312318104059'),
//                     pw.Text('Zoho'),
//                     pw.Text('6'),
//                     pw.SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//           ],
//         ),

//         pw.GridView(
//           crossAxisCount: 5,
//           childAspectRatio: 1,
//           crossAxisSpacing: 1.0,
//           mainAxisSpacing: 10.0,
//           children: [
//             for (var i = 0; i <= 14; i++)
//               pw.Column(
//                 children: <pw.Widget>[
//                   pw.Container(
//                     height: 80,
//                     width: 50,
//                     child: pw.Image(profileImage),
//                   ),
//                    Displaypanel(kNames[i],kNo[i],kComp[i],kPack[i]),
//                 ],
//               ),
//             for (Student student in placedStudents)
//               pw.Column(
//                 children: <pw.Widget>[
//                   Displaypanel(student.name, student.regno, student.company,
//                       student.package),
//                   pw.Container(
//                     height: 80,
//                     width: 50,
//                     child: pw.Image(img),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//         pw.Container(height: 50),
//         pw.Center(
//           child: pw.Text('CONGRAGULATIONS STUDENTS!'),
//         ),
//       ],
//     ),
//   );

//   return await doc.save();
// }