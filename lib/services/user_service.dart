
import 'package:dio/dio.dart';
import 'package:hive_demo/database/user_database/userData.dart';
import 'package:hive_demo/utils/app_string.dart';

class UserService {
  final client = Dio();

  Future<UserData?> getData()async {
    try{
      final response = await client.get(AppString.urlUserDataList);
      if(response.statusCode == 200){
        return UserData.fromJson(response.data);
      }
    }
    catch (e){
      print(e.toString());
      return null;
    }
    return null;
  }
}