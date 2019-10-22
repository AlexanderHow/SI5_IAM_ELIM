// Flutter code sample for

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/view/patient_infos/WebViewPatientInfo.dart';

void main() => runApp(Blx2000());

class Blx2000 extends StatelessWidget {
  static const String _title = 'Biological_Logistic_eXtrasmart';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MockedIdentification(),
    );
  }
}

class MockedIdentification extends StatelessWidget {
  String _idPatient = "";
  String _idMedic = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Identification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to BLX 2000",
            ),
            TextField(
              onChanged: (idMed){
                this._idMedic = idMed;
              },
              decoration: InputDecoration(
                hintText: "Your employee Id",
                border: InputBorder.none,
              ),
            ),
            TextField(
              onChanged: (idPat){
                this._idPatient = idPat;
              },
              decoration: InputDecoration(
                hintText: "Id Patient",
                border: InputBorder.none,
              ),
            ),
            RaisedButton(
              child: Text("Link Starto"),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return WebViewPatientInfo(this._idMedic, this._idPatient);
                })
              ),
            ),
          ],
        ),
      ),
    );
  }
}