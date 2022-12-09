import 'package:panabo_seminar/model/personal_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedAccount{

  static const KEY_USER = "USER_KEY";

  Future<bool> setAccount(PersonalInfo personalInfo) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(KEY_USER, personalInfo.toRawJson());
  }

  Future<bool> checkAccount() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey(KEY_USER);
  }

  Future<PersonalInfo> getAccount() async {
    final pref = await SharedPreferences.getInstance();
    var rawData = pref.getString(KEY_USER);
    return PersonalInfo.fromRawJson(rawData!);
  }

  Future<bool> removeAccount() async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(KEY_USER);
  }
}