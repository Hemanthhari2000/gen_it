import 'package:flutter/material.dart';
import 'package:gen_it/theme/font_style.dart';

Widget buildRegNo(viewModel, regnoEditingController) {
  return TextFormField(
    controller: regnoEditingController,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
    ),
    style: kFMontserrat,
    validator: (value) {
      if (value.length < 4) {
        return "Enter correct register number";
      } else {
        return null;
      }
    },
    onSaved: (value) {
      viewModel.setInputData(key: "regno", val: value);
      regnoEditingController.text = "";
    },
    

  );
}

Widget buildName(viewModel, nameEditingController) {
  return TextFormField(
    controller: nameEditingController,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
    ),
    style: kFMontserrat,
    validator: (value) {
      if (value.length < 4) {
        return "Enter correct name";
      } else {
        return null;
      }
    },
    onSaved: (value) {
      viewModel.setInputData(key: "name", val: value);
      nameEditingController.text="";
    },
  );
}

Widget buildCompany(viewModel, companyEditingController) {
  return TextFormField(
    controller: companyEditingController,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
    ),
    style: kFMontserrat,
    validator: (value) {
      if (value.length < 2) {
        return "Enter correct Company Name";
      } else {
        return null;
      }
    },
    onSaved: (value) {
      viewModel.setInputData(key: "company", val: value);
      companyEditingController.text = "";
    },
  );
}

Widget buildPackage(viewModel, packageEditingController) {
  return TextFormField(
    controller: packageEditingController,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
    ),
    style: kFMontserrat,
    validator: (value) {
      if (value.isNotEmpty) {
        return null;
      } else {
        return "Enter correct package";
      }
    },
    onSaved: (value) {
      viewModel.setInputData(key: "package", val: value);
      packageEditingController.text = "";
    },
  );
}

Widget buildTextField({String label, Widget child}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        flex: 1,
        child: Text(
          label,
          style: kFMontserrat,
        ),
      ),
      Expanded(
        flex: 2,
        child: SizedBox(
          width: 400,
          child: child,
        ),
      ),
    ],
  );
}
