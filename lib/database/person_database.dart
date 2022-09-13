
import 'dart:io';

import 'package:hive/hive.dart';

part 'person_database.g.dart';

@HiveType(typeId: 1)
class Person {
  Person({required this.name, required this.age, required this.friends});

  @HiveField(0)
  String name;

  @HiveField(1)
  String age;

  @HiveField(2)
  List<String> friends;

  @override
  String toString() {
    return '$name, $age, ${friends.toString()}';
  }
}