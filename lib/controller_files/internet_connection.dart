import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:hive_demo/utils/app_string.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnection with ChangeNotifier {
  static final Connectivity connectivity = Connectivity();
  static late StreamSubscription<ConnectivityResult> connectivitySubscription;
  static late InternetConnectionChecker  internetConnectivitySubscription;
  bool isDeviceConnected = true;

   void checkInternetConnection() {
    initConnectivity();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

   Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result);
  }

   Future<void> _updateConnectionStatus(
      ConnectivityResult? result) async {

     isDeviceConnected = await InternetConnectionChecker().hasConnection;

    print('result ===> $result');
    notifyListeners();
  }

  final StreamSubscription<InternetConnectionStatus> listener =
  InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) async{
      switch (status) {
        case InternetConnectionStatus.connected:
          print(AppString.isAvailableData);
          break;
        case InternetConnectionStatus.disconnected:
          print(AppString.disconnectedData);
          break;
      }
    },
  );

  static void cancelSubscription() async {
    await connectivitySubscription.cancel();
  }
}
