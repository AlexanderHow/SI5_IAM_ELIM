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
    this._tools.add(new ToolModel("Test_effort", "Test d'effort", "C'est pour mesurer le pouls, voila comment. Avant connexion, placez les électrodes sur le torse du patient", 'accelerometre', {}, {"Mouvement" : [1, 7, 1], "Stabilité" : [1, 5, 2]}, {"Mouvement" : Accelerometer(), "Stabilité" : Gyroscope()}));
    this._tools.add(new ToolModel("Test_vision", "Test de vue", "Pour effectuer un test de vision, voila comment", 'vue', {"Répétition" : 1, "Daltonisme" : 2}, {"Distance" : [1, 10, 1]}, {"Proximité" : ProximitySensor()}));
    this._tools.add(new ToolModel("Test_vision", "Mesures sanguines", "How to use tool 3", 'accelerometre', {"T3In1" : 1}, {"T3DB1" : [1, 80, 20]}, {}));
    this._tools.add(new ToolModel("Test_vision", "Tensiomètre", "How to use tool 4", 'accelerometre', {}, {"T4DB1" : [1, 80, 20]}, {}));
    this._tools.add(new ToolModel("Test_vision", "Capteur oculaire", "How to use tool 5", 'accelerometre', {"T5In1" : 1, "T5In2" : 1}, {"T5DB1" : [1, 80, 20], "T5DB2" : [1, 80, 20]}, {}));
    this._tools.add(new ToolModel("Test_vision", "Analyse cérébrale", "How to use tool 6", 'accelerometre', {}, {"T6DB1" : [1, 80, 20], "T6DB2" : [1, 80, 20], "T6DB3" : [1, 80, 20], "T6DB4" : [1, 80, 20], "T6DB5" : [1, 80, 20], "T6DB6" : [1, 80, 20]}, {}));
  }

  List<ToolModel> getTools(int principalIllness, int howMany){
    if(howMany < 0 || howMany > this._tools.length){
      howMany = this._tools.length;
    }
    List<ToolModel> res_prio = new List<ToolModel>();
    //List<ToolModel> res_rest = new List<ToolModel>();

    for(int i = 0; i < howMany; ++i){
      /*if(this._tools[i].usefullForIllness == principalIllness){
        res_prio.add(this._tools[i]);
      }else{
        res_rest.add(this._tools[i]);
      }*/
      res_prio.add(this._tools[i]);
    }

    //res_prio.addAll(res_rest);
    return res_prio;
  }

  factory ToolMock() {
    return _singleton;
  }
}