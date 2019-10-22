import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools_components/dataBlock.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools_components/inputsBlock.dart';

class ToolModel with ChangeNotifier{
  InputsBlock _inputs;
  List<DataBlock> _data;
  int _idIllnessUsedFor;
  String _name;
  String _descr;
  String _manual;

  ToolModel(String name, String descr, String manual, int idIllnessUsedFor, Map<String, int> descrInputs, Map<String, List<int>> descrData){
    this._name = name;
    this._descr = descr;
    this._manual = manual;
    this._idIllnessUsedFor = idIllnessUsedFor;
    this._inputs = new InputsBlock(descrInputs);
    this._data = new List<DataBlock>();
    descrData.forEach((String name, List<int> param){
      this._data.add(new DataBlock(name, param));
    });
  }

  void updateDataBlock(int pos, List<double> newData){
    if(pos < this._data.length){
      this._data[pos].updateData(newData);
      if(this._data[pos].alert){
        DataBlock tmp = this._data[pos];
        this._data.removeAt(pos);
        this._data.insert(0, tmp);
        notifyListeners();
      }
    }
  }

  InputsBlock get inputsBlock => this._inputs;
  List<DataBlock> get dataBlocks => this._data;
  String get description => this._descr;
  String get manual => this._manual;
  String get name => this._name;
  int get usefullForIllness => this._idIllnessUsedFor;

}