import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/GoogleAuth.dart';
import 'package:flutter_sc/Model/Data/TokenKey.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/Data/Url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A class for managing user data and authentication.
class UserDto extends ChangeNotifier {
  UserInfoDB userInfo = UserInfoDB();

  /// Saves user information to the server.
  Future<http.Response> saveUser(String id, String email, String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('accessToken') ?? '';
    Map<String, String> headers = {
      'accept': 'application/json;charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    Map data = {
      'id': userInfo.id,
      'email': userInfo.email,
      'name': userInfo.displayName
    };
    var body = json.encode(data);
    var response = await http.post(Uri.parse(AUTH_CREATE_URL),
        headers: headers, body: body);
    print(response.statusCode);
    print(response.body);
    return response;
  }

  /// Fetches user information from the server.
  Future<UserInfoDB> fetchUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    GoogleAuth googleAuth = GoogleAuth();
    String token = prefs.getString('accessToken') ?? '';
    print('token: $token');

    final dynamic response = await http.get(Uri.parse(USER_INFO_URL), headers: {
      'accept': 'application/json;charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
    print('fetchUser: ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> json = jsonDecode(response.body);
      UserInfoDB member = UserInfoDB.fromJson(json);
      print('회원 정보 받아오기 성공');
      UserInfoProvider userInfoProvider = UserInfoProvider();
      userInfoProvider.userInfo = member;
      print('member: $member');
      print('id: ${member.id}');
      return member;
    } else {
      throw Exception('Failed to fetch member, 회원 정보 받아오기 실패 ');
    }
  }

  /// Checks if the user is logged in.
  Future<bool> loginCheck(String token) async {
    final responseCheck = await http.get(Uri.parse(USER_INFO_URL),
        headers: {'Authorization': 'Bearer $token'});
    if (responseCheck.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  /// Gets a list of logged-in users.
  Future<void> getLoginList() async {
    final routeFromJsonFile =
        await rootBundle.loadString('assets/json/g_user_detail.json');
    Map<String, dynamic> userInfoMap = json.decode(routeFromJsonFile);

    final userinfoDB = UserInfoDB.fromJson(userInfoMap);

    userinfoDB.id = userinfoDB.id;
    userinfoDB.displayName = userinfoDB.displayName;
    userinfoDB.email = userinfoDB.email;

    print("====== userInfoDBList ${userinfoDB.id}");

    notifyListeners();
  }
}
