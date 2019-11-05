import 'dart:async';

import 'package:flutter_app_blx2000/model/Sensors/SensorInterface.dart';
import 'package:flutter_app_blx2000/model/toolModel.dart';
import 'package:sensors/sensors.dart';

class Gyroscope extends SensorInterface{
  @override
  List<StreamSubscription> streamSubscriptions = <StreamSubscription<dynamic>>[];
  @override
  ToolModel toolModel;
  @override
  int pos;
  @override
  bool subscribed = false;

  Gyroscope();

  @override
  void subscribeToSensor() {
    this.streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      if(toolModel != null){
        List<List<double>> dataSet = new List<List<double>>();
        dataSet.add(<double>[event.x]);
        dataSet.add(<double>[event.y]);
        dataSet.add(<double>[event.z]);
        toolModel.addDataToDataBlock(pos, dataSet);
      }
    }));
    this.subscribed = true;
  }

  @override
  void unsubscribeToSensor() {
    for (StreamSubscription<dynamic> subscription in this.streamSubscriptions) {
      subscription.cancel();
    }
    this.streamSubscriptions = <StreamSubscription<dynamic>>[];
    this.subscribed = false;
  }
}