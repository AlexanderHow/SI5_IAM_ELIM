import 'dart:async';

import 'package:flutter_app_blx2000/model/toolModel.dart';

abstract class SensorInterface{
  List<StreamSubscription<dynamic>> streamSubscriptions;
  ToolModel toolModel;
  int pos;
  bool subscribed;


  void subscribeToSensor();
  void unsubscribeToSensor();
}