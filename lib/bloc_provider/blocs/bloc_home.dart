import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:panabo_seminar/bloc_provider/bloc_provider.dart';
import 'package:panabo_seminar/model/personal_info.dart';
import 'package:panabo_seminar/provider/sqlite/sql_user.dart';
import 'package:panabo_seminar/screens/home/pages/home_page.dart';
import 'package:panabo_seminar/screens/home/pages/profile_page.dart';
import 'package:panabo_seminar/screens/home/pages/users_local.dart';
import 'package:panabo_seminar/services/api_home.dart';

class BlocHome implements BlocBase{
  SQLUsers _sqlUsers = SQLUsers();
  ApiHome _apiHome = ApiHome();

  List<Widget> listHomePages = [HomePage(), UsersLocal(), ProfilePage()];

  StreamController<int> pageCtrlr = StreamController<int>.broadcast();
  Stream<int> get streamPage => pageCtrlr.stream;
  Sink<int> get sinkPage => pageCtrlr.sink;
  void setHomePage(int index) {
    sinkPage.add(index);
  }

  List<PersonalInfo>? get personalInfos => _personalInfos;
  List<PersonalInfo>? _personalInfos;

  Future<List<PersonalInfo>> getUsers() async {
    await Future.delayed(Duration(seconds: 3));
    var res = await _apiHome.getUsers();
    _personalInfos = res;

    await saveUsers(res);
    return res;
  }

  Future<List<PersonalInfo>> getUsersLocal() async {
    await Future.delayed(Duration(seconds: 3));
    return await _sqlUsers.getUsers();
  }

  Future saveUsers(List<PersonalInfo> list) async {
    var res = await _sqlUsers.saveUsers(list);

    for (var element in res) {
      print(element.toString());
    }
  }


  
  @override
  void dispose() {
    
  }

}