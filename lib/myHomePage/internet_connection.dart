import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnection with ChangeNotifier{
  // static ConnectivityResult connectionStatus = ConnectivityResult.none;
  static final Connectivity connectivity = Connectivity();
  static late StreamSubscription<ConnectivityResult> connectivitySubscription;
  static late InternetConnectionChecker  internetConnectivitySubscription;
  bool isDeviceConnected = false;

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

   Future _updateConnectionStatus(
      ConnectivityResult? result) async {
     isDeviceConnected = await InternetConnectionChecker().hasConnection;

     if(result == ConnectivityResult.none){
       print('isDeviceConnected if== $isDeviceConnected');
     }
     else if(result == ConnectivityResult.wifi){
       print('isDeviceConnected else== $isDeviceConnected');
     }
    // connectionStatus = result!;
    print('result ===> $result');
    notifyListeners();
  }

  final StreamSubscription<InternetConnectionStatus> listener =
  InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) async{
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    },
  );

  static void cancelSubscription() async {
    await connectivitySubscription.cancel();
  }
}
