import 'package:flutter/material.dart';

import 'events.dart';



class MySearchDelegate extends SearchDelegate<String>{
  final List<String> _words;
  final List<String> _history;

  MySearchDelegate(List<String> words): _words = words,_history = [""],super();

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
      ? IconButton(
        tooltip: 'Voice Search',
        icon: const Icon(Icons.mic),
        onPressed: (){
          this.query = 'TODO: implement voice';
        },
      ) 
      :IconButton(
        tooltip: 'clear',
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        this.close(context, null);  
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Center(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Text("you have selected the word:"),
    //         GestureDetector(
    //           onTap: (){
    //             this.close(context, this.query);
    //           },
    //           child: Text(
    //             this.query,
    //             style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty ? _history 
    : _words.where((word) => word.startsWith(query));
      return null;
  //   return _SuggestionList(
  //     query: this.query,
  //     suggestions: suggestions.toList(),
  //     onSelected: (String suggestion){
  //       this.query = suggestion;
  //       this._history.insert(0, suggestion);
  //       showResults(context);
  //     },
  //   );
  // }
}

// class _SuggestionList extends StatelessWidget{
//   final List<String> suggestions;
//   final String query;
//   final ValueChanged<String> onSelected;

//   const _SuggestionList({this.suggestions,this.query,this.onSelected});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme.subhead;
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (BuildContext context, int i){
//         final String suggestion = suggestions[i];
//         return ListTile(
//           leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
//           title: RichText(
//             text: TextSpan(
//               text: suggestion.substring(0,query.length),
//               style: textTheme.copyWith(fontWeight: FontWeight.bold),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: suggestion.substring(query.length),
//                   style: textTheme,
//                 )
//               ]
//             ),
//           ),
//         );
//       },
//     );
//   }

}