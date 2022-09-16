import 'package:get_it/get_it.dart';
import 'package:hive_demo/controller/internet_connection.dart';

GetIt getIt = GetIt.instance;

 void defineValue (){
  getIt.registerLazySingleton<InternetConnection>(()=>InternetConnection());
  // getIt.registerLazySingleton<MyHomePageController>(() => MyHomePageController());
}