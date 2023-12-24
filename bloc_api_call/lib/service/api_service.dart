import 'package:bloc_api_call/model/user_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<List<UserModel>> getData() async {

    List<UserModel> userList = [];
    final Dio _dio = Dio();

    try {
      Response response =
          await _dio.get("https://jsonplaceholder.typicode.com/users");

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        for (var element in data) {
          UserModel userModel = UserModel.fromJson(element);
          userList.add(userModel);
        }
        return userList;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
