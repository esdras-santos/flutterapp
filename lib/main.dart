//import 'package:baco_project/screens/event.dart';
import 'package:baco_project/screens/home.dart';
//import 'package:baco_project/screens/login.dart';
import 'package:baco_project/screens/menu.dart';
//import 'package:baco_project/screens/setting.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("pt","BR")
      ],
      debugShowCheckedModeBanner: false,
      title: 'Baco-app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleHiddenDrawer(
        menu: Menu(),
        screenSelectedBuilder: (position, controller) {
          Widget screenCurrent;
          screenCurrent = Home(controller);
          return screenCurrent;
        },
      ),
    );
  }
}
