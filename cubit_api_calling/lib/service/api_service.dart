import 'dart:convert';

import 'package:cubit_api_calling/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> getData() async {
    List<UserModel> userModel = [];
    try {
      var request = http.Request(
          'GET', Uri.parse("https://jsonplaceholder.typicode.com/users"));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(rawData);
        for (var element in data) {
          UserModel model = UserModel.fromJson(element);
          userModel.add(model);
        }
        return userModel;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
