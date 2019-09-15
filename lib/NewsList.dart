import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewsBox.dart';

import 'News.dart';

class NewsList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NewsListState();
  }
}

class NewsListState extends State<NewsList> {
  List<News> news = [];
  
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemCount : 5,itemBuilder: (context, index) {
      return ListTile(title : NewsBox(news[index].title, news[index].text, imageUrl: news[index].imageUrl));
    });
  }
}