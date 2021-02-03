import 'package:flutter/material.dart';


class SearchEvent extends StatefulWidget{
  var query;
  SearchEvent(this.query);
  @override
  State<StatefulWidget> createState() {
    return _SearchEventState();
  }
}

class _SearchEventState extends State<SearchEvent>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text("This is the Search Screen vc procurou por ${widget.query}"),
      )
    );
  }

}