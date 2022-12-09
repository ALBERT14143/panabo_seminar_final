import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';
import 'package:panabo_seminar/model/dto/dto_credentials.dart';
import 'package:panabo_seminar/model/dto/dto_personal_info.dart';
import 'package:panabo_seminar/model/personal_info.dart';
import 'package:panabo_seminar/provider/shared/shared_account.dart';
import 'package:panabo_seminar/services/api_account.dart';

class BlocAccount implements BlocBase{
  ApiAccount _apiAccount = ApiAccount();
  SharedAccount _sharedAccount = SharedAccount();

  final TextEditingController firstNameCtrlr = TextEditingController();
  final TextEditingController middleNameCtrlr = TextEditingController();
  final TextEditingController lastNameCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();
  final TextEditingController usernameCtrlr = TextEditingController();
  final TextEditingController passwordCtrlr = TextEditingController();

  PersonalInfo? get personalInfo => _personalInfo;
  PersonalInfo? _personalInfo;

  StreamController<String> appBarCtrlr = StreamController<String>.broadcast();
  Stream<String> get streamAppBaar => appBarCtrlr.stream;
  Sink<String> get sinkAppBar => appBarCtrlr.sink;

  StreamController<bool> loadingCtrlr = StreamController<bool>.broadcast();
  Stream<bool> get streamLoading => loadingCtrlr.stream;
  Sink<bool> get sinkLoading => loadingCtrlr.sink;
  void setLoadingEvent(bool event) {
    sinkLoading.add(event);
  }

  Future<String> register() async {
    var dto = DtoPersonalInfo(
      firstName: firstNameCtrlr.text,
      middleName: middleNameCtrlr.text,
      lastName: lastNameCtrlr.text,
      address: addressCtrlr.text,
      username: usernameCtrlr.text,
      password: passwordCtrlr.text
    );

    await Future.delayed(Duration(seconds: 3));

    return await _apiAccount.register(dto);
  }

  Future<PersonalInfo> login() async {
    var dto = DtoCredentials(
      username: usernameCtrlr.text,
      password: passwordCtrlr.text
    );
    await Future.delayed(Duration(seconds: 2));
    var res = await _apiAccount.login(dto);
    _personalInfo = res;

    return res;
  }

  Future setSharedAccount(PersonalInfo personalInfo) async {
    await _sharedAccount.setAccount(personalInfo);
  }

  Future<bool> checkSharedAccount() async {
    await Future.delayed(Duration(seconds: 3));
    var isOk = await _sharedAccount.checkAccount();

    if (isOk) {
      var res = await _sharedAccount.getAccount();
      _personalInfo = res;
    }

    return isOk;
  }

  //=================================================================================================

  PickedFile? pickedFile;
  pickFile() async {
    pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  }

  Future upload() async {
    await _apiAccount.updateProfile(pickedFile!);
  }
  
  @override
  void dispose() {
    appBarCtrlr.close();
    loadingCtrlr.close();
  }
  
}