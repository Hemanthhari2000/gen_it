import 'dart:convert';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:gen_it/core/models/student_model.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:gen_it/core/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class HomeViewModel extends BaseViewModel {
  Logger log;

  HomeViewModel() {
    log = getLogger(runtimeType.toString());
  }

  final List<Student> _placedStudents = [];

  get getPlacedStudents => _placedStudents;

  init() async {
    await FirebaseFirestore.instance
        .collection('placed')
        .orderBy('createdAt', descending: false)
        .get()
        .then((value) => {
              // ignore: avoid_function_literals_in_foreach_calls
              value.docs.forEach((element) {
                _placedStudents.add(Student.fromMap(element.data()));
              })
            });
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

    var fileName = inputData['regno'].substring(inputData['regno'].length - 4);

    String downloadURL = await FirebaseStorage.instance
        .ref('students/$fileName.jpg')
        .getDownloadURL();

    await setInputData(key: "imageURL", val: downloadURL);

    await setInputData(key: "createdAt", val: FieldValue.serverTimestamp());

    await FirebaseFirestore.instance.collection('placed').add(inputData);

    showTopSnackBar(
      context,
      const CustomSnackBar.success(message: "Details Added SUCCESSFULLY!"),
    );

    _isLoading = false;
    notifyListeners();
  }
}
