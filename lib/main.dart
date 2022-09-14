import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_demo/database/user_database/userData.dart';
import 'package:hive_demo/myHomePage/internet_connection.dart';
import 'package:hive_demo/myHomePage/myHomePage.dart';
import 'package:hive_demo/myHomePage/myHomePage_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'database/person_database.dart';

void main() async {
  InternetConnection internetConnection = InternetConnection();
  WidgetsFlutterBinding.ensureInitialized();
  internetConnection.checkInternetConnection();
  Directory? dir = await getExternalStorageDirectory();
  Hive
    ..init(dir!.path)
    ..registerAdapter(PersonAdapter())
    ..registerAdapter(DatumAdapter())
    ..registerAdapter(SupportAdapter())
    ..registerAdapter(UserDataAdapter());


  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<MyHomePageController>(create: (context){
            return MyHomePageController();
          }),
          ChangeNotifierProvider<InternetConnection>(create: (context){
            return InternetConnection();
          })
        ],
       child: const MyApp(),
      )
  );
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
