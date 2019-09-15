import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsBoxFavorite extends StatefulWidget {

  final int _count;
  final bool _liked;

  NewsBoxFavorite(this._count, this._liked);

  @override
  State<StatefulWidget> createState() {
    return NewsBoxFavoriteState(_count, _liked);
  }
}

class NewsBoxFavoriteState extends State<NewsBoxFavorite> {
  int count;
  bool liked;

  NewsBoxFavoriteState(this.count, this.liked);

  void onPressButton () {
     setState(() {
       liked = !liked;

       if (liked) {
         count++;
       } else {
         count--;
       }
     });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Text("There are \n$count favorited", textAlign: TextAlign.center),
      new IconButton(
          icon: new Icon(liked ? Icons.star : Icons.star_border, size: 30.0, color: Colors.blue[500]),
          onPressed: onPressButton
      )
    ],
    );
  }
}