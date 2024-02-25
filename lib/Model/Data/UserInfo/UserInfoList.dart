import 'dart:convert';

import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';

/// Class representing a list of user information objects.
class UserInfoDBList {
  final List<UserInfoDB>? userinfoDbs;

  /// Constructor for UserInfoDBList.
  UserInfoDBList({this.userinfoDbs});

  /// Factory method to create UserInfoDBList object from JSON string.
  factory UserInfoDBList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<UserInfoDB> userinfoDbs = <UserInfoDB>[];

    userinfoDbs = listFromJson
        .map((userinfoDb) => UserInfoDB.fromJson(userinfoDb))
        .toList();
    return UserInfoDBList(userinfoDbs: userinfoDbs);
  }
}
