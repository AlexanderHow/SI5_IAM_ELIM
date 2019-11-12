import 'package:flutter/material.dart';
class PatientRecordModel {
  final String firstName;
  final String lastName;
  final Map<String, Map<String, int>> syndroms;

  PatientRecordModel({this.firstName, this.lastName, this.syndroms});

  factory PatientRecordModel.fromJson(Map<String, dynamic> json) {
    Map<String, Map<String, int>> mapOfSyndroms = new Map<String, Map<String, int>>();
    //mapOfSyndroms.addAll(json['symptomes']); TODO
    return PatientRecordModel(
        firstName: json['prenom'],
        lastName: json['nom'],
        syndroms: mapOfSyndroms
    );
  }

  List<Widget> getPatientInfosComponents(BuildContext context){
    List<Widget> res = new List<Widget>();
    res.add(Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text("General Infos\n"),
          ),
          Container(
            width : MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/4,
            child: Column(
              children: <Widget>[
                Text("First name : "+this.firstName),
                Text("Last name : "+this.lastName),
              ],
            )
          ),
        ],
      )
    ));

    this.syndroms.forEach((zone, descr){
      List<Widget> tmpDescr = new List<Widget>();
      descr.forEach((k, level){
        tmpDescr.add(Text(k + " : " + level.toString()));
      });
      res.add(Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.assignment_ind),
                title: Text(zone + "\n"),
              ),
              Container(
                  width : MediaQuery.of(context).size.width,
                  child: Column(
                    children: tmpDescr,
                  )
              ),
            ],
          )
      ));
    });

    return res;
  }
}