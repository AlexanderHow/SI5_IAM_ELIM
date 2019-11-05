import 'package:flutter/material.dart';
//TODO : Statefull pour les onChanged, add type 3 dropdownbutton
class InputsBlock extends StatefulWidget {
  final Map<String, int> _descrInputs;

  InputsBlock(this._descrInputs);

  bool get isEmpty => this._descrInputs.length <= 0;

  @override
  State<StatefulWidget> createState() => InputsBlockState(this._descrInputs);
}

class InputsBlockState extends State<InputsBlock>{
  final Map<String, int> _descrInputs;
  final Map<String, String> _inputsValues = new Map<String, String>();

  InputsBlockState(this._descrInputs);

  @override
  Widget build(BuildContext context) {
    List<Widget> listInputs = new List<Widget>();
    this._descrInputs.forEach((String name, int type){
      listInputs.add(new Container(
        width : MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/10,
        child: Row(
          children: <Widget>[
            Container(width: MediaQuery.of(context).size.width/5,child: Text(name+" : ")),
            Container(
              width: MediaQuery.of(context).size.width*4/5,
              child: (type == 1) ?
              new TextField(onChanged: (v){setState(() {
                this._inputsValues[name]=v.toString();
              });}):
              new Checkbox(value: this._inputsValues[name]=="true", onChanged: (v){setState(() {
                this._inputsValues[name]=v.toString();
              });}),
            )
          ],
        ),
      ));
    });

    listInputs.add(Center(
      child: new Container(
        width : MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height/10,
        child: RaisedButton(onPressed: null, child: Text("Send command"), padding: EdgeInsets.fromLTRB(10, 10, 10, 10), color: Colors.lightBlue,),
      ),
    ));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: listInputs,
      ),
    );
  }
}