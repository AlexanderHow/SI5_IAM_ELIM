import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/model/Sensors/SensorInterface.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools_components/dataBlock.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools_components/inputsBlock.dart';

class ToolModel with ChangeNotifier{
  static const MAX_DATA_SIZE = 6;
  InputsBlock _inputs;
  List<DataBlock> _data;
  String _idIllnessUsedFor;
  String _name;
  String _descr;
  String _manual;

  ToolModel(String name, String descr, String manual, String idIllnessUsedFor, Map<String, int> descrInputs, Map<String, List<int>> descrData, Map<String, SensorInterface> sensorAttached){
    this._name = name;
    this._descr = descr;
    this._manual = manual;
    this._idIllnessUsedFor = idIllnessUsedFor;
    this._inputs = new InputsBlock(descrInputs);
    this._data = new List<DataBlock>();
    int pos = 0;
    descrData.forEach((String name, List<int> param){
      SensorInterface si = sensorAttached[name];
      if(si != null){
        si.pos = pos;
        si.toolModel = this;
      }
      this._data.add(new DataBlock(name, param, si));
      ++pos;
    });
  }

  //TODO : gérer multidimensional data (example : (x,y,z) from accelero)
  void addDataToDataBlock(int pos, List<List<double>> dataSet){
    if(pos < this._data.length){
      List<double> currentData = this._data[pos].data;
      List<double> newData = new List<double>();

      if((currentData.length + dataSet[0].length) >= MAX_DATA_SIZE){
        if(dataSet[0].length >= MAX_DATA_SIZE){
          for(int i = (dataSet[0].length - MAX_DATA_SIZE); i < dataSet[0].length; ++i){
            newData.add(dataSet[0][i]);
          }
        }else{
          int howManyWeKeep = MAX_DATA_SIZE - dataSet[0].length;
          for(int j = (currentData.length - howManyWeKeep); j < currentData.length; ++j){
            newData.add(currentData[j]);
          }
          newData.addAll(dataSet[0]);
        }
      }else{
        newData.addAll(currentData);
        newData.addAll(dataSet[0]);
      }

      this._data[pos].updateData(newData);
      if(this._data[pos].alert){
        /*DataBlock tmp = this._data[pos];
        this._data.removeAt(pos);
        this._data.insert(0, tmp);*/

        for(int k = 0; k < this._data.length; ++k){
          this._data[k].updateSensorPos(k);
        }

        notifyListeners();
      }
    }
  }

  void updateDataBlock(int pos, List<double> newData){
    if(pos < this._data.length){
      this._data[pos].updateData(newData);
      if(this._data[pos].alert){
        /*DataBlock tmp = this._data[pos];
        this._data.removeAt(pos);
        this._data.insert(0, tmp);*/

        for(int k = 0; k < this._data.length; ++k){
          this._data[k].updateSensorPos(k);
        }

        notifyListeners();
      }
    }
  }

  void unsubscribeAllDataBlock(){
    this._data.forEach((db){
      db.unsubscribeSensor();
    });
  }

  int getLevelOfHarm(){
    int res = 0;
    for(DataBlock db in this.dataBlocks){
      res += db.getLevelOfHarm();
    }
    res = (res / this.dataBlocks.length).ceil();
    return res;
  }

  InputsBlock get inputsBlock => this._inputs;
  List<DataBlock> get dataBlocks => this._data;
  String get description => this._descr;
  String get manual => this._manual;
  String get name => this._name;
  String get measurementName => this._idIllnessUsedFor;

}