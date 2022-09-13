import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../database/person_database.dart';

class MyHomePageController with ChangeNotifier {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  displayValue() async {
    var box = await Hive.openBox('testBox');
    var person = Person(age: ageController.text.trim(),
        name: nameController.text.trim(),
        friends: ['manish', 'jayesh']);

    // we can check condition here that internet is available or not
    await box.put('name', person);
    print(box.get('name'));
  }

}

