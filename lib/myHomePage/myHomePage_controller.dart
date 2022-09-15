import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/database/user_database/userData.dart';
import 'package:hive_demo/dependancy_injection/define_controller.dart';
import 'package:hive_demo/controller_files/internet_connection.dart';
import 'package:hive_demo/services/user_service.dart';
import 'package:hive_demo/utils/hive_key.dart';

class MyHomePageController with ChangeNotifier {

 //define object of InternetConnection using getIt
 InternetConnection internet = getIt<InternetConnection>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  UserData userData = UserData();
  List<dynamic> userList = [];

  UserService userService = UserService();

  displayValue(context) async {
    var boxX = await Hive.openBox(HiveKey.userDataBox);

    // check condition here that internet is available or not
    if(internet.isDeviceConnected == true){
      apiCallingFun();
    }
    else{
      userList = boxX.get(HiveKey.modelOfUserData);
      notifyListeners();
    }
  }

  apiCallingFun()async{
    var box = await Hive.openBox(HiveKey.userDataBox);
    userService.getData().then((value){
      if(value != null){
        userData = value;
        userList = value.data!;
        box.put(HiveKey.modelOfUserData,value.data);
      }
      notifyListeners();
    });
  }
}

