import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewsBoxFavorite.dart';

class NewsBox extends StatelessWidget{
  final String _title;
  final String _text;
  String _imageUrl;

  NewsBox(this._title, this._text, {String imageUrl}) {
    _imageUrl = imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageUrl != null && _imageUrl != ''){
      return new Container(
        color: Colors.blueGrey[100],
        height: 100.0,
        child: new Row (children: <Widget>[
          new Image.network(_imageUrl, height: 100.0, width: 100.0, fit: BoxFit.cover),
          new Expanded(child: new Container(
            padding: new EdgeInsets.all(5.0),
            child: new Column(children: <Widget>[
              new Text(_title, style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
              new Expanded(child: new Text(_text, softWrap: true, textAlign: TextAlign.justify,))
            ]),
          )),
          new NewsBoxFavorite(0, false)
        ],
        ),
      );
    }

    return new Container(
      color: Colors.blueGrey[100],
      height: 100.0,
      child: new Row (children: <Widget>[
        new Expanded(child: new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Column(children: <Widget>[
            new Text(_title, style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
            new Expanded(child: new Text(_text, softWrap: true, textAlign: TextAlign.justify,))
          ]),
        ))
      ],
      ),
    );
  }
}