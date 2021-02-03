import 'package:baco_project/utils/events.dart';
import 'package:baco_project/utils/money_format.dart';
import 'package:flutter/material.dart';
import 'package:baco_project/screens/geolocation.dart';

class Event extends StatefulWidget {
  EventDesc event;
  String tag;
  Event({this.event, this.tag});

  @override
  State<StatefulWidget> createState() {
    return _EventState();
  }
}

class _EventState extends State<Event> {
  Icon favoriteIcon = Icon(Icons.favorite_border);
  bool liked;
  int index;

  @override
  void initState() {
    super.initState();
    liked = ClientsList.likedList.contains(widget.event);
  }

  _pressed() {
    //isso deve ser removido no futuro
    //uso somente para testes
    var newClientsList = [];
    for (index = 0; index < ClientsList.eventList.length; index++) {
      if (widget.event.name == ClientsList.eventList[index].name) {
        break;
      }
    }
    setState(() {
      liked = !liked;
    });
    if (liked == false) {
      //Posteriormente o elemento deve ser removido na lista do backend
      ClientsList.likedList.remove(widget.event);
      if (ClientsList.eventList[index].numberOfLikes != 0 &&
          ClientsList.eventList.isNotEmpty) {
        ClientsList.eventList[index].numberOfLikes--;
      }
      newClientsList = ClientsList.likedList;
    } else if (liked == true) {
      //Posteriormente o elemento deve ser adicionado na lista do backend
      ClientsList.likedList.add(widget.event);
      if (ClientsList.eventList.isNotEmpty) {
        ClientsList.eventList[index].addLike();
      }
      newClientsList = ClientsList.likedList;
    }
    setState(() {
      ClientsList.likedList = newClientsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    String lote;
    switch (widget.event.lot) {
      case 1:
        lote = "Primeiro";
        break;
      case 2:
        lote = "Segundo";
        break;
      case 3:
        lote = "Terceiro";
        break;
      case 4:
        lote = "Quarto";
        break;
      case 5:
        lote = "Quinto";
        break;
    }
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
            pinned: false,
            floating: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.tag,
                child: Image(
                  height: 400.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.event.url),
                ),
              ),
            ),
          ),
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.purple[600]),
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 60.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.event.name,
                style: TextStyle(fontSize: 16, color: Colors.purple[600]),
              ),
            ),
            actions: <Widget>[
              IconButton(
                iconSize: 40,
                icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
                color: Colors.purple[600],
                onPressed: () {
                  _pressed();
                },
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                    RaisedButton(
                      highlightElevation: 10.0,
                      elevation: 8,
                      color: Colors.purple,
                      onPressed: (){
                        ClientsList.ticketList.add(widget.event);
                        print("Ingresso comprado");
                      },
                      textColor: Colors.white,
                      child: Text(
                        "Comprar Ingresso",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ),
                    SizedBox(width: 40,),
                    Text(
                          MoneyFormat(widget.event.price).formatToString(),
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(widget.event.description),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Center(
                        child: Text(
                          "O evento será relizado no dia " + widget.event.date,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      
                      Center(
                        child: Text(
                          lote + " Lote",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: ActionChip(
                          backgroundColor: Colors.purple[600],
                          shadowColor: Colors.purple[600],
                          //elevation: 6.0,
                          avatar: Icon(Icons.location_on, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventGeolocator()));
                          },
                          label: Text(
                            "Localização",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
