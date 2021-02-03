import 'package:baco_project/utils/events.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BuyedTicket extends StatefulWidget {
  EventDesc event;
  String tag;
  BuyedTicket({this.event, this.tag});

  @override
  State<StatefulWidget> createState() {
    return _BuyedTicketState();
  }
}

class _BuyedTicketState extends State<BuyedTicket> {
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
    // FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        // amount: widget.event.price,
        // settings: MoneyFormatterSettings(
        //     symbol: 'R\$',
        //     thousandSeparator: '.',
        //     decimalSeparator: ',',
        //     fractionDigits: 2,
        //     compactFormatType: CompactFormatType.short));
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
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  QrImage(
                    //"data:" deve ser extraido do banco de dados offline e futuramente deve ser addicionado o nome
                    // do comprador do ingresso e o timestamp deve ser adicionado ao banco de dados
                    data: widget.event.name +
                        widget.event.date +
                        "${DateTime.now()}" +
                        "${widget.event.lot}",
                    version: QrVersions.auto,
                    size: 330.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Center(
                      child: Text("Apresente esse QR code junto ao seu RG."),
                    ),
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
                  // Center(
                  //   child: Text(
                  //     "Preço: " + fmf.output.symbolOnLeft,
                  //     style: TextStyle(
                  //         fontSize: 16.0, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
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
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Container(
                //         height: 65.0,
                //         width: 65.0,
                //         child: FittedBox(
                //           child: FloatingActionButton(
                //             child: Icon(Icons.location_on),
                //             onPressed: () {
                //               //...
                //             },
                //             backgroundColor: Colors.purple[600],
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 130,
                //       ),
                //       FloatingActionButton(
                //         child: Icon(Icons.cancel),
                //         onPressed: (() => {}),
                //         backgroundColor: Colors.purple[600],
                //       ),
                //       SizedBox(
                //         width: 60,
                //       )
                //     ],
                //   ),
                   SizedBox(
                     height: 20.0,
                   )
                 ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
