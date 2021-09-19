import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:firebase_core/firebase_core.dart';

import 'core/locator.dart';
import 'core/router_constants.dart';
import 'core/router.dart' as router;

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await LocatorInjector.setUpLocator();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: homeViewRoute,
    );
  }
}
