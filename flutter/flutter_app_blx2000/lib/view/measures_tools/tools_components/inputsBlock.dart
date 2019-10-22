import 'package:flutter/material.dart';

class InputsBlock extends StatelessWidget{
  final Map<String, int> _descrInputs;
  final Map<String, String> _inputsValues = new Map<String, String>();

  InputsBlock(this._descrInputs);

  @override
  Widget build(BuildContext context) {
    List<Widget> listInputs = new List<Widget>();
    this._descrInputs.forEach((String name, int type){
      listInputs.add(new Center(
        child: Row(
          children: <Widget>[
            Text(name+" : "),
            (type == 2) ?
                new Checkbox(value: false, onChanged: (v){this._inputsValues[name]=v.toString();}):
                new TextField(onChanged: (v){this._inputsValues[name]=v.toString();})
          ],
        ),
      ));
    });

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: listInputs,
      ),
    );
  }
}