import 'package:get_it/get_it.dart';
import 'package:hive_demo/controller_files/internet_connection.dart';
import 'package:hive_demo/myHomePage/myHomePage_controller.dart';

GetIt getIt = GetIt.instance;

 void defineValue (){
  getIt.registerLazySingleton<InternetConnection>(()=>InternetConnection());
  getIt.registerLazySingleton<MyHomePageController>(() => MyHomePageController());
}