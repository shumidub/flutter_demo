import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewsBoxFavorite.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
            key: this._formKey,
            child: Column(children: <Widget>[
              Text('User name:', style: TextStyle(fontSize: 20.0)),
              // ignore: missing_return
              TextFormField(validator: (text) {
                if (text.isEmpty) return "Field should be filled";
              }),
              SizedBox(height: 20.0),
              Text('Email:', style: TextStyle(fontSize: 20.0)),
              // ignore: missing_return
              TextFormField(validator: (text) {
                if (text.isEmpty) return "Field should be filled";

                final String p = "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                RegExp regExp = new RegExp(p);
                if (!regExp.hasMatch(text)) return "Please, enter correct email";
              }),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: (){
                  if (_formKey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Field succesfully filled!"), backgroundColor : Colors.green[500])
                    );
                  }
                },
                child: Text('Validate'),
                color: Colors.blue,
                textColor: Colors.white
              )
            ],
            )
        )
    );
  }
}
