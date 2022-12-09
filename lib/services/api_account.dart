import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:panabo_seminar/components/app_constant.dart';
import 'package:panabo_seminar/model/dto/dto_credentials.dart';
import 'package:panabo_seminar/model/dto/dto_personal_info.dart';
import 'package:panabo_seminar/model/personal_info.dart';
import 'package:path/path.dart';

class ApiAccount{

  Future<String> register(DtoPersonalInfo dtoPersonalInfo) async {
    final path = "new-training/api/PersonalInfo/PostUser";

    final url = Uri.http(AppConstant.baseUrl, path);

    try {
      final response = await http.post(
        url, 
        body: dtoPersonalInfo.toRawJson(), 
        headers: AppConstant.userHeader
      );
      if (response.statusCode != 201) {
        throw response.reasonPhrase.toString();
      }
      return response.body;
    } catch (e) {
      rethrow;
    }
  }


  Future<PersonalInfo> login(DtoCredentials dto) async {
    final path = "new-training/api/Account/Login";

    final url = Uri.http(AppConstant.baseUrl, path);

    try {
      final response = await http.post(url, body: dto.toRawJson(), headers: AppConstant.userHeader);
      if (response.statusCode != 200) {
        throw response.body;
      }
      return PersonalInfo.fromRawJson(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future updateProfile(PickedFile file) async {
    var path  = "new-training/api/PersonalInfo/UploadPhoto";
    var url = Uri.http(AppConstant.baseUrl, path);

    try {
      final request = http.MultipartRequest("PUT", url);

      request.fields["userId"] = "6d2f400d-0664-4289-82b4-e1f153af2e20";
      request.files.add(await http.MultipartFile.fromBytes("PhotoFile", File(file.path).readAsBytesSync(), filename: basename(file.path)));

      var response = await request.send();
      if (response.statusCode != 200) {
        throw Exception();
      }
      return response.statusCode;

      // final Dio _dio = Dio(
      //   BaseOptions(
      //     receiveTimeout: 1000 * 30
      //   )
      // );

      // final path = "http://192.168.8.113/new-training/api/PersonalInfo/UploadPhoto";

      // var formData = FormData.fromMap({
      //   "userId": "6d2f400d-0664-4289-82b4-e1f153af2e20",
      //   "PhotoFile": await MultipartFile.fromFile(file.path, filename: basename(file.path))
      // });
      

      // try {
      //   final response = await _dio.put(path, data: formData);
      //   return response.statusCode;
      // } catch (e) {
        
      // }
    } catch (e) {
      rethrow;
    }
  }
}