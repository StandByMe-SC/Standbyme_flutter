import 'package:flutter/foundation.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';

/// Provider class for managing user information.
class UserInfoProvider with ChangeNotifier {
  UserInfoDB? _userInfo;

  /// Getter for user information.
  UserInfoDB? get userInfo => _userInfo;

  /// Setter for user information.
  set userInfo(UserInfoDB? userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}
