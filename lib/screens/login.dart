import 'package:baco_project/screens/stores/phone_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneStore = PhoneStore();

    void _nextStep() {
      print("Botão ativado");
    }

    return Material(
        child: Scaffold(
            body: ListView(
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Center(
          child: Text(
              "Você ainda não é cadastrado.\n"
              "     Crie sua conta no Baco!",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[600])),
        ),
        SizedBox(
          height: 100.0,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 30.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.purple[600],
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0)
                  ]),
              width: 300.0,
              height: 300.0,
              //padding: EdgeInsets.only(left:30.0,right: 30.0),
              child: Container(
                width: 250.0,
                height: 290.0,
                padding: EdgeInsets.only(left: 20, right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Center(
                      child: Text(
                        "Seu número de telefone:",
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.purple[600]),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 200.0,
                      child: TextField(
                        onChanged: phoneStore.changePhone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: "DDD e Número",
                            labelStyle: TextStyle(fontSize: 20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Observer(
                      builder: (_) => MaterialButton(
                        minWidth: double.infinity,
                        child: Text(
                          "Continuar",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: phoneStore.buttonEnabled ? _nextStep : null,
                        textColor: Colors.white,
                        color: Colors.purple[600],
                        disabledColor: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    )));
  }
}
