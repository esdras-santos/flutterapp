import 'package:baco_project/screens/managedsettings.dart';
import 'package:baco_project/utils/events.dart';
import 'package:baco_project/utils/money_format.dart';
import 'package:flutter/material.dart';


class MyManagedEvents extends StatefulWidget {
  ManageEvent event;
  String tag;
  ClientsList cl = ClientsList();

  MyManagedEvents({this.event, this.tag});
  @override
  State<StatefulWidget> createState() {
    return _MyManagedEventsState();
  }
}

class _MyManagedEventsState extends State<MyManagedEvents> {
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: Text(widget.event.name),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ManagedSetting()),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          SizedBox(height: 10),
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Valor Arrecadado: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    MoneyFormat("${widget.event.collectedAmount}").formatToString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Seu Ranking: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "${widget.cl.getRank(widget.event)}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Número de Likes: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "${widget.event.numberOfLikes}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Valor do Ingresso: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    MoneyFormat("${widget.event.valuePerTicket}").formatToString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Ingressos Vendidos: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "${widget.event.ticketSolds}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          widget.event.isLoted
              ? Column(
                  children: <Widget>[
                    Card(
                      elevation: 6.0,
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Lote: ",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              "${widget.event.lot}",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                )
              : Container(),
          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
          Card(
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Ingressos Disponíveis: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "${widget.event.totIngre - widget.event.ticketSolds}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          //essa informação deve ser atualizada de forma dinamica ultizando dados do backend
        ],
      ),
    );
  }
}
