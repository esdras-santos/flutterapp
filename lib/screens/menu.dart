import 'package:baco_project/screens/myEvents.dart';
import 'package:baco_project/screens/setting.dart';
import 'package:baco_project/screens/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

import 'createEvent.dart';
import 'myTicket.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return WillPopScope(
      onWillPop: () {
        SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(0);
      },
      child: Material(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 25.0,
            top: 150.0,
          ),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: Text(
                  "olá Esdras",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              // ListTile(
              //     onTap: () {
              //       SimpleHiddenDrawerProvider.of(context)
              //           .setSelectedMenuPosition(0);
              //     },
              //     title: Text(
              //       "Home",
              //       style:
              //           TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              //     )),
              
              ListTile(
                  onTap: () {
                    //THIS PATH SHOULD BE FIX FOR THE RIGHT PATH
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ticket()));
                  },
                  title: Text(
                    "Meus Ingressos",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
              ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //THIS EVENTS MUST BE TAKED FROM THE BACKEND
                        builder: (_) => CreateEvent(),
                      ),
                    );
                  },
                  title : Text(
                    "Criar Evento",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
              ListTile(
                  onTap: () {
                    //THIS PATH SHOULD BE FIX FOR THE RIGHT PATH
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyEvents()));
                  },
                  title: Text(
                    "Administrar Evento",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
              ListTile(
                  onTap: () {
                    //THIS PATH SHOULD BE FIX FOR THE RIGHT PATH
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ValidateTicket()));
                  },
                  title: Text(
                    "Validar Ingressos",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),

              ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Setting()));
                  },
                  title: Text(
                    "Configurações",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

ListTile item(var context, int position, String title) {
  return ListTile(
      onTap: () {
        SimpleHiddenDrawerProvider.of(context)
            .setSelectedMenuPosition(position);
      },
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ));
}
