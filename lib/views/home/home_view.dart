library home_view;

import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen_it/theme/font_style.dart';
import 'package:gen_it/widgets/smart_widgets/build_textfield_widgets.dart';
import 'package:gen_it/widgets/smart_widgets/pdf_generation.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'home_view_model.dart';

import 'package:pdf/widgets.dart' as pw;
part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
          // viewModel.init();
        },
        builder: (BuildContext context, HomeViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _HomeMobile(viewModel),
            desktop: _HomeDesktop(viewModel),
            tablet: _HomeTablet(viewModel),
          );
        });
  }
}
