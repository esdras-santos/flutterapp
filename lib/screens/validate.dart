import 'package:baco_project/screens/qrscanner.dart';
import 'package:baco_project/utils/events.dart';
import 'package:flutter/material.dart';

class ValidateTicket extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ValidateTicketState();

}
class _ValidateTicketState extends State<ValidateTicket>{

  Widget ticketCards(EventDesc event,BuildContext context){
    return Card(
        elevation: 5.0,
        child: InkWell(
          //Posteriormente isso deve ser alterado para uma tela onde o
          //ingresso deve ser mostrado mesmo offline
          onTap: () => {Navigator.push(
             context,
             MaterialPageRoute(
               builder: (_) => QRViewExample(), 
             ),
          ),},
          child: Hero(
            tag: event.url+"managed",
            child: Container(
              width: double.infinity,
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 130.0,
                    height: double.infinity,
                    child: Image(
                      image: AssetImage(event.url),
                    ),
                  ),
                  SizedBox(width: 19.0,),
                  Material(child: Text(
                    event.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20.0),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  List<Widget> myEventsList(BuildContext context){
    List<Widget> tikList = [];
    for(int i=0;i<ClientsList.eventList.length;i++){
      tikList.add(ticketCards(ClientsList.valTick[i],context));
    }
    return tikList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[600],
          title: Text("Validar evento"),
          actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () => {},
            child: Text("AJUDA",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
        ),
      body: ListView(
        children: myEventsList(context),
      ),
    );
  }

}