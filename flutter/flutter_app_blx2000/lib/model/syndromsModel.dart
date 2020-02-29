import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/model/syndromsDetailsModel.dart';
import 'dart:convert';

class SyndromsModel {
  final Map<String, SyndromsDetailsModel> syndroms;

  SyndromsModel({this.syndroms});

  factory SyndromsModel.fromJson(Map<String, dynamic> rep) {
    Map<String, SyndromsDetailsModel> mapOfSyndroms = new Map<String, SyndromsDetailsModel>();
    rep.forEach((syndromName, syndromDetails){
      mapOfSyndroms[syndromName.toString()] = SyndromsDetailsModel.fromJson(syndromDetails);
    });
    return SyndromsModel(
        syndroms : mapOfSyndroms
    );
  }

  List<Widget> getSyndromsComponents(BuildContext context){
    List<Widget> syndromsList = new List<Widget>();
    this.syndroms.forEach((syndromName, details){
      Widget compo = new Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.assignment_ind),
              title: Text(syndromName + "\n"),
            ),
            Container(
                width : MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: details.getSyndromsDetailsComponents(context),
                ),
            ),
          ],
        )
      );
      syndromsList.add(compo);
    });
    return syndromsList;
  }
}