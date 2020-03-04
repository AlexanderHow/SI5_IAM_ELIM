import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/model/patientRecordModel.dart';
import 'package:http/http.dart' as http;

class PatientInfos extends StatelessWidget {

  PatientInfos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<PatientRecordModel>(
        future: getPatientInfos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: snapshot.data.getPatientInfosComponents(context),
                ),
              ),
            );
          } else if (snapshot.hasError) { //checks if the response throws an error
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<PatientRecordModel> getPatientInfos() async {
    String url = 'http://elimproject.pythonanywhere.com/patients/patient1';
    final response = await http.get(url, headers: {"Accept": "application/json"});

    if (response.statusCode == 201) {
      return PatientRecordModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}