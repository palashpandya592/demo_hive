import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_demo/controller/internet_connection.dart';
import 'package:hive_demo/database/coin_database/allcoin_list_model.dart';
import 'package:hive_demo/database/coin_database/coin_image_model.dart';
import 'package:hive_demo/dependancy_injection/define_controller.dart';
import 'package:hive_demo/myHomePage/myhomepage.dart';
import 'package:hive_demo/myhomepage/homepage_controller.dart';
import 'package:hive_demo/utils/app_string.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  defineValue();
  InternetConnection internet = getIt<InternetConnection>();
  WidgetsFlutterBinding.ensureInitialized();

  internet.checkInternetConnection();
  Directory? dir = await getExternalStorageDirectory();
  Hive
    ..init(dir!.path)
    ..registerAdapter(AllCoinListModelAdapter())
    ..registerAdapter(CoinImageModelAdapter());


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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.flutterDemo,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
