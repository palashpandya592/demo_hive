import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/database/user_database/userData.dart';
import 'package:hive_demo/myHomePage/internet_connection.dart';
import 'package:hive_demo/services/user_service.dart';
import '../database/person_database.dart';

class MyHomePageController with ChangeNotifier {

  InternetConnection internetConnection = InternetConnection();


  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  UserData userData = UserData();
  List<dynamic> userList = [];

  UserService userService = UserService();

  displayValue() async {
    var box = await Hive.openBox('testBox');
    var person = Person(age: ageController.text.trim(),
        name: nameController.text.trim(),
        friends: ['manish', 'jayesh']);
    var boxX = await Hive.openBox('testBox12');

    // we can check condition here that internet is available or not
    if(internetConnection.isDeviceConnected == true){
      print('apiCallingFun ===> ${internetConnection.isDeviceConnected}');
      apiCallingFun();
    } else{
      userList = boxX.get('userData');
      notifyListeners();
    }
  }

  apiCallingFun()async{
    var box = await Hive.openBox('testBox12');
    userService.getData().then((value){
      if(value != null){
        userData = value;
        userList = value.data!;
        box.put('userData',value.data);
        print('userData =====> ${userData.data!.first.firstName}');
      }
      notifyListeners();

    });
  }

}

