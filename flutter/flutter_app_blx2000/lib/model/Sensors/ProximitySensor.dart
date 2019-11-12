import 'dart:async';

import 'package:flutter_app_blx2000/model/Sensors/SensorInterface.dart';
import 'package:flutter_app_blx2000/model/toolModel.dart';
import 'package:all_sensors/all_sensors.dart';

class ProximitySensor extends SensorInterface{
  @override
  List<StreamSubscription> streamSubscriptions = <StreamSubscription<dynamic>>[];
  @override
  ToolModel toolModel;
  @override
  int pos;
  @override
  bool subscribed = false;

  ProximitySensor();

  @override
  void subscribeToSensor() {
    this.streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
      if(toolModel != null){
        List<List<double>> dataSet = new List<List<double>>();
        dataSet.add(<double>[event.proximity]);
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