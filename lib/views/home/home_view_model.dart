import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:gen_it/core/models/student_model.dart';
import 'package:gen_it/widgets/smart_widgets/pdf_generation.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:stacked/stacked.dart';
import 'package:gen_it/core/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import 'package:pdf/widgets.dart' as pw;

class HomeViewModel extends BaseViewModel {
  Logger log;

  HomeViewModel() {
    log = getLogger(runtimeType.toString());
  }

  List<Student> _placedStudents = [];

  get getPlacedStudents => _placedStudents;

  init() async {
    await FirebaseFirestore.instance
        .collection('placed')
        .orderBy('createdAt', descending: false)
        .get()
        .then(
          (value) => {
            // ignore: avoid_function_literals_in_foreach_calls
            value.docs.forEach(
              (element) {
                _placedStudents.add(Student.fromMap(element.data()));
              },
            ),
          },
        );
    final jsonList = _placedStudents.map((e) => jsonEncode(e)).toList();
    final uniqueList = jsonList.toSet().toList();
    final result = uniqueList.map((item) => jsonDecode(item)).toList();

    _placedStudents.clear();
    for (var element in result) {
      _placedStudents.add(Student.fromJson(element));
    }

    // _placedStudents = result;
    // var data = await FirebaseFirestore.instance
    //     .collection('placed')
    //     .orderBy('createdAt', descending: false)
    //     .get();
    // data.docs.forEach((element) async {
    //   // print(element.data());
    //   var mapData = element.data();
    //   var fileName = mapData['regno'].substring(mapData['regno'].length - 4);
    //   var bytes = await FirebaseStorage.instance
    //       .ref('students/$fileName.jpg')
    //       .getData(100000000);
    //   mapData['imageBytes'] = bytes;
    //   print(mapData);
    // });
  }

  Map<String, dynamic> inputData = {};
  get getInputData => inputData;

  setInputData({key, val}) {
    inputData[key] = val;
  }

  bool _isLoading = false;
  get isLoading => _isLoading;

  uploadDataToFirebase(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    await setInputData(key: "createdAt", val: FieldValue.serverTimestamp());

    await FirebaseFirestore.instance.collection('placed').add(inputData);

    showTopSnackBar(
      context,
      const CustomSnackBar.success(message: "Details Added SUCCESSFULLY!"),
    );

    _isLoading = false;
    notifyListeners();
  }

  // Uint8List _imageBytes;
  // get getImageBytes => _imageBytes;

  // test() async {
  //   var data = await FirebaseStorage.instance
  //       .ref('students/4059.jpg')
  //       .getData(100000000)
  //       .then((value) => _imageBytes = value);
  //   notifyListeners();
  // }

  bool _previewLoading = false;
  get isPreviewLoading => _previewLoading;

  previewButtonOnPressed() async {
    _previewLoading = true;
    notifyListeners();

    await init();
    Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async {
        return await generatePdf(format, getPlacedStudents);
      },
      format: PdfPageFormat.a4,
    );
    _previewLoading = false;
    notifyListeners();
  }
}
