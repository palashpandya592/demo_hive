import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_demo/myHomePage/myHomePage.dart';
import 'package:path_provider/path_provider.dart';

import 'database/person_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Directory? dir = await getExternalStorageDirectory();
  Hive..init(dir!.path)
  ..registerAdapter(PersonAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
