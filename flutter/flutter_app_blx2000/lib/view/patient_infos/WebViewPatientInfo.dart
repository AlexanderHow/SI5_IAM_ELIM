import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/main.dart';
import 'package:flutter_app_blx2000/view/measures_tools/ListTools.dart';
import 'package:flutter_app_blx2000/view/patient_infos/PatientInfos.dart';
import 'package:provider/provider.dart';

class WebViewPatientInfo extends StatelessWidget {
  String _idMedic = "";
  String _idPatient = "";
  RefreshNotifer _refreshNotifer = RefreshNotifer();

  WebViewPatientInfo(this._idMedic,this._idPatient);

  @override
  Widget build(BuildContext context) {
    return this._getPatientView(context);
  }

  //TODO : FUTURE USE : create the webview to get the patient's health records
  //Both patient and medic id can be integrated to the web page so this mobile app won't need the main.dart component or the patient and medic ids
  Widget _getPatientView(context){
    RefreshNotifer rn = Provider.of<RefreshNotifer>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Patient Health Records"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ListTools();
                  })
              ),
            ),
          ],
        ),
        body: Center(
          child: /*Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Text("Hello Doctor."+this._idMedic),
              Text("Here goes the web view of health records"),
              Text("Patient is "+this._idPatient)
            ],
          ),*/
          PatientInfos()
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            rn.triggerRefresh();
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}