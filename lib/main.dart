import 'package:flutter/material.dart';
import 'MyForm.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: new Text('Flutter Demo')),
          body: MyForm()
      )
    )
);
