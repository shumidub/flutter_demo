import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  Gender _gender;
  bool _agreement = false;

  void _setGender(Gender gender) {
    this._gender = gender;
  }

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

              Text('Gender:', style: TextStyle(fontSize: 20.0),),
              Row(mainAxisAlignment : MainAxisAlignment.center, children: <Widget>[
                Radio(value: Gender.male, groupValue: _gender, onChanged: (Gender value) { _setGender(value); setState(() {});}),
                Text("Man"),
                Radio(value: Gender.female, groupValue: _gender, onChanged: (Gender value) { _setGender(value); setState(() {});}),
                Text("Woman")
              ]),
              Padding(padding: EdgeInsets.only(top: 10.0)),

              CheckboxListTile(value: _agreement, title: Text("Agreement"), onChanged: (bool value){ setState(() { _agreement = value; });}),

              RaisedButton(
                onPressed: (){
                  String text = '';
                  if (_gender == null) text = 'Select you gender\n';
                  if (_agreement == false) text = text + 'Need accept agreement';

                  if (text.isNotEmpty){
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(text), backgroundColor : Colors.red[500])
                    );
                  }

                  if (_formKey.currentState.validate() && text.isEmpty){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Fields are succesfully filled!"), backgroundColor : Colors.green[500])
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

enum Gender {male, female}
