
import 'package:dio/dio.dart';
import 'package:hive_demo/database/user_database/userData.dart';

class UserService {
  final client = Dio();

  Future<UserData?> getData()async {
    try{
      final responce = await client.get('https://reqres.in/api/users?page=2');
      if(responce.statusCode == 200){
        // print('data ===> ${responce.data}');
        return UserData.fromJson(responce.data);
      }
    }
    catch (e){
      print(e.toString());
      return null;
    }
    return null;
  }
}