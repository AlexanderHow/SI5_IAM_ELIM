import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/model/syndromsModel.dart';
import 'dart:convert';

class PatientRecordModel {
  final String firstName;
  final String lastName;
  final String diagnostic;
  final SyndromsModel syndroms;

  PatientRecordModel({this.firstName, this.lastName, this.diagnostic, this.syndroms});

  factory PatientRecordModel.fromJson(Map<String, dynamic> rep) {
    return PatientRecordModel(
        firstName: rep['prenom'],
        lastName: rep['nom'],
        diagnostic: rep['cluster'],
        syndroms: SyndromsModel.fromJson(rep['symptomes'])
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
                Text("May have : " + this.diagnostic)
              ],
            )
          ),
        ],
      )
    ));

    res.addAll(this.syndroms.getSyndromsComponents(context));

    return res;
  }
}