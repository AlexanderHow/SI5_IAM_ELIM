import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataBlock extends StatelessWidget{
  final String _descrData;
  final List<int> _param;
  List<double> _data;
  bool _inAlert = false;


  DataBlock(this._descrData, this._param){
    Random rng = new Random();
    _data = new List<double>();
    _data.add(rng.nextDouble()*100);
    _data.add(rng.nextDouble()*100);
    _data.add(rng.nextDouble()*100);
    _data.add(rng.nextDouble()*100);
  }

  bool get alert => this._inAlert;

  void updateData(List<double> newData){
    this._inAlert = false;
    for(double d in newData){
      if(d <= this._param[2] || d >= this._param[1]){
        this._inAlert = true;
        break;
      }
    }
    this._data=newData;
  }

  Widget _createChart(){
    Widget res;
    List<_Data> dtmp = new List<_Data>();
    for(int i = 0; i < this._data.length; ++i){
      dtmp.add(new _Data(i, this._data[i]));
    }

    switch(this._param[0]){
      case 1:
        List<charts.Series<_Data, int>> seriesList;
        seriesList = [
          new charts.Series<_Data, int>(
            id: 'Sensor Data',
            colorFn: (_, __) => (this._inAlert) ? charts.MaterialPalette.red.shadeDefault : charts.MaterialPalette.blue.shadeDefault,
            domainFn: (_Data data, _) => data._index,
            measureFn: (_Data data, _) => data._value,
            data: dtmp,
          )
        ];
        res = new charts.LineChart(
            seriesList,
            animate: false,
            defaultRenderer: new charts.LineRendererConfig(includePoints: true)
        );
        break;
      case 2:
        List<charts.Series<_Data, String>> seriesList;
        seriesList = [
          new charts.Series<_Data, String>(
            id: 'Sensor Data',
            colorFn: (_, __) => (this._inAlert) ? charts.MaterialPalette.red.shadeDefault : charts.MaterialPalette.blue.shadeDefault,
            domainFn: (_Data data, _) => data._index.toString(),
            measureFn: (_Data data, _) => data._value,
            data: dtmp,
          )
        ];
        res = new charts.BarChart(
            seriesList,
            animate: false,
            vertical: false,
        );
        break;
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<double>>(
      stream: Stream.periodic(Duration(seconds: 1)).asyncMap((_)=>this._data),
      builder: (context, snapshot) {
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: (this._inAlert)? Icon(Icons.warning, color: Colors.red) : Icon(Icons.insert_chart),
                title: Text(this._descrData + "\n"),
              ),
              Container(
                width : MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/4,
                child: _createChart()
              ),
            ],
          )
        );
      }
    );
  }
}

class _Data {
  final int _index;
  final double _value;

  _Data(this._index, this._value);
}