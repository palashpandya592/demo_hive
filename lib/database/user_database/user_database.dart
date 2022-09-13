import 'package:hive/hive.dart';
part 'user_database.g.dart';

@HiveType(typeId: 2)
class User{
  User({required this.id, required this.title, required this.body});

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;
}