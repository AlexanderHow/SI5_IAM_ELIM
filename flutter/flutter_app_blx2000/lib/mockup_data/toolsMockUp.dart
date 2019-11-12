import 'package:flutter_app_blx2000/model/Sensors/Accelerometer.dart';
import 'package:flutter_app_blx2000/model/Sensors/Gyroscope.dart';
import 'package:flutter_app_blx2000/model/Sensors/ProximitySensor.dart';
import 'package:flutter_app_blx2000/model/toolModel.dart';

class ToolMock {
  static final ToolMock _singleton = ToolMock._internal();
  List<ToolModel> _tools;
//TDB : [type, seuil min seuil max]
  ToolMock._internal(){
    this._tools = new List<ToolModel>();
    this._tools.add(new ToolModel("Électrocardiogramme", "Électrocardiogramme", "C'est pour mesurer le pouls, voila comment. Avant connection, placez les électrodes sur le torse du patient", 2, {}, {"Mesure temps réel" : [1, 80, 20], "Évolution" : [2, 80, 20], "Proximité" : [2, 10, -10]}, {"Mesure temps réel" : Accelerometer(), "Évolution" : Gyroscope(), "Proximité" : ProximitySensor()}));
    this._tools.add(new ToolModel("Thermomètre", "Thermomètre", "Pour mesurer la température, voila comment", 1, {"Répétition" : 1, "Celsius" : 2}, {"Température" : [1, 80, 20]}, {}));
    this._tools.add(new ToolModel("Mesures sanguines", "This is tool 3", "How to use tool 3", 2, {"T3In1" : 1}, {"T3DB1" : [1, 80, 20]}, {}));
    this._tools.add(new ToolModel("Tensiomètre", "This is tool 4", "How to use tool 4", 3, {}, {"T4DB1" : [1, 80, 20]}, {}));
    this._tools.add(new ToolModel("Capteur oculaire", "This is tool 5", "How to use tool 5", 3, {"T5In1" : 1, "T5In2" : 1}, {"T5DB1" : [1, 80, 20], "T5DB2" : [1, 80, 20]}, {}));
    this._tools.add(new ToolModel("Analyse cérébrale", "This is tool 6", "How to use tool 6", 1, {}, {"T6DB1" : [1, 80, 20], "T6DB2" : [1, 80, 20], "T6DB3" : [1, 80, 20], "T6DB4" : [1, 80, 20], "T6DB5" : [1, 80, 20], "T6DB6" : [1, 80, 20]}, {}));
  }

  //TODO : order fct(poste, pathologie, tache prio user) + module pos en alerte
  List<ToolModel> getTools(int principalIllness, int howMany){
    if(howMany < 0 || howMany > this._tools.length){
      howMany = this._tools.length;
    }
    List<ToolModel> res_prio = new List<ToolModel>();
    List<ToolModel> res_rest = new List<ToolModel>();

    for(int i = 0; i < howMany; ++i){
      if(this._tools[i].usefullForIllness == principalIllness){
        res_prio.add(this._tools[i]);
      }else{
        res_rest.add(this._tools[i]);
      }
    }

    res_prio.addAll(res_rest);
    return res_prio;
  }

  factory ToolMock() {
    return _singleton;
  }
}