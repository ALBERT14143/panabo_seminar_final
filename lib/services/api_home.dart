import 'dart:convert';

import 'package:panabo_seminar/components/app_constant.dart';
import 'package:http/http.dart' as http;
import 'package:panabo_seminar/model/personal_info.dart';

class ApiHome{

  Future<List<PersonalInfo>> getUsers() async {

    final path = "new-training/api/PersonalInfo/GetUser";

    final url = Uri.http(AppConstant.baseUrl, path);

    try {
      final response = await http.get(url, headers: AppConstant.userHeader);
      if (response.statusCode != 200) {
        throw response.body;
      }

      var rawData = jsonDecode(response.body) as List;
      
      return rawData.map((e) => PersonalInfo.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}