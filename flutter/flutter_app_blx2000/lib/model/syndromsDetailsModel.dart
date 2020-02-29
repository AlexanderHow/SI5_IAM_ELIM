import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SyndromsDetailsModel {
  final Map<String, int> syndromsDetails;
  List<TextEditingController> controllers = new List<TextEditingController>();

  SyndromsDetailsModel({this.syndromsDetails}){
    for(int i = 0; i < this.syndromsDetails.length; ++i){
      controllers.add(new TextEditingController());
    }
  }

  factory SyndromsDetailsModel.fromJson(Map<String, dynamic> rep) {
    Map<String, int> mapOfSyndromsDetails = new Map<String, int>();
    rep.forEach((zoneName, levelOfHarm){
      mapOfSyndromsDetails[zoneName.toString()] = int.parse(levelOfHarm.toString());
    });
    return SyndromsDetailsModel(syndromsDetails : mapOfSyndromsDetails);
  }

  Widget getSyndromsDetailsComponents(BuildContext context){
    List<Widget> details = new List<Widget>();
    int i = 0;
    this.syndromsDetails.forEach((zoneName, levelOfHarm){
      this.controllers[i].text = levelOfHarm.toString();
      details.add(
        Container(
          width: MediaQuery.of(context).size.width,
          child: new Row(
            children: <Widget>[
              Text(zoneName + " : "),
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: TextFormField(
                  controller: this.controllers[i],
                ),
              )
            ],
          ),
        )
      );
      ++i;
    });
    details.add(new Align(
      alignment: Alignment.centerRight,
      child: RaisedButton(
        onPressed: (){
          String url = 'http://elimproject.pythonanywhere.com/patients/patient1';
          String jsonBody = '{';
          for(int i = 0; i < this.controllers.length; ++i){
            jsonBody = jsonBody + '\"' + this.syndromsDetails.keys.toList()[i] + '\": ' + this.controllers[i].text + ', ';
          }
          jsonBody = jsonBody.substring(0, jsonBody.length-2);
          jsonBody = jsonBody + '}';
          http.put(url, headers: {"Content-type": "application/json"}, body: jsonBody);
        },
        child: Text("Valider"),
      ),
    ));

    Form res = new Form(
      child: Column(
        children: details,
      )
    );
    /*
    this.syndromsDetails.forEach((zoneName, levelOfHarm){
      details.add(new Text(zoneName + " : " + levelOfHarm.toString()));
    });
    * */
    return res;
  }
}