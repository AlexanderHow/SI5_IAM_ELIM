import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/model/toolModel.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools/CommonTool.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:math';

class CommonToolWrapper extends StatelessWidget{
  ToolModel _tool;

  CommonToolWrapper(this._tool);

  Future<bool> _onWillPop() {
    this._tool.unsubscribeAllDataBlock();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: //Will be usefull to reorder datablock order, get provider in commontooldatablock, notify in update + reorder
      WillPopScope(
        onWillPop: _onWillPop,
        child: ChangeNotifierProvider<ToolModel>.value(
          notifier: this._tool,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(child: Text("General Infos"),),
                    Tab(child: Text("Input Parameters"),),
                    Tab(child: Text("Measures"),),
                  ],
                ),
                title: Text(this._tool.name),
              ),
              body: TabBarView(
                  children: <Widget>[
                    CommonToolDataBlock(),
                    CommonToolInputs(this._tool.inputsBlock),
                    CommonToolGeneralInfo(this._tool.name, this._tool.description, this._tool.manual)
                  ]
              ),

              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  int lvlOfHarm = this._tool.getLevelOfHarm();
                  print(lvlOfHarm.toString());
                  String mesure = this._tool.measurementName;
                  String url = 'http://elimproject.pythonanywhere.com/patients/patient1';
                  String jsonBody = '{\"' + mesure + '\": ' + lvlOfHarm.toString() + '}';
                  http.put(url, headers: {"Content-type": "application/json"}, body: jsonBody);
                },
                child: Icon(Icons.navigation),
              ),
            ),
          ),
        ),
      )
    );
  }
}