import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../database/person_database.dart';

class MyHomePageController with ChangeNotifier{

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  displayValue()async{
    var box = await Hive.openBox('testBox');
    var person = Person(age: ageController.text.trim(),name: nameController.text.trim(),friends: ['manish','Jayesh']);

    await box.put('dave', person);

    print(box.get('dave'));
    print('value ======> ${nameController.text.trim()}');
  }
}

