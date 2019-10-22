import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/model/toolModel.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools/CommonTool.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class CommonToolWrapper extends StatelessWidget{
  ToolModel _tool;

  CommonToolWrapper(this._tool);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: //Will be usefull to reorder datablock order, get provider in commontooldatablock, notify in update + reorder
      ChangeNotifierProvider<ToolModel>.value(
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
            //RaisedButton(onPressed: (){print("DEBUG : Added to patient record");}), //TODO : implement that
            floatingActionButton: FloatingActionButton(
                onPressed: (){
                  Random rng = new Random();
                  List<double> newData = new List<double>();
                  newData.add(rng.nextDouble()*100);
                  newData.add(rng.nextDouble()*100);
                  newData.add(rng.nextDouble()*100);
                  newData.add(rng.nextDouble()*100);
                  newData.add(rng.nextDouble()*100);
                  newData.add(rng.nextDouble()*100);
                  this._tool.updateDataBlock(1, newData);
                }
            ),
          ),
        ),
      )
    );
  }
}