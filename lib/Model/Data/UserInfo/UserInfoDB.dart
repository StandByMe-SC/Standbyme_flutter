// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';

/// Class representing user information.
class UserInfoDB extends ChangeNotifier {
  int? _id; //userid인건지 ,,
  String? _displayName;
  String? _email;

  /// Constructor for UserInfoDB.
  UserInfoDB({
    int? id,
    String? displayName,
    String? email,
  })  : _id = id,
        _displayName = displayName,
        _email = email;

  //provider
  /// Getter for user ID.
  int? get id => _id;

  /// Setter for user ID.
  set id(int? value) {
    _id = value;
    notifyListeners();
  }

  /// Getter for display name.
  String? get displayName => _displayName;

  /// Setter for display name.
  set displayName(String? value) {
    _displayName = value;
    notifyListeners();
  }

  /// Getter for email.
  String? get email => _email;

  /// Setter for email.
  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  /// Converts UserInfoDB object to map.
  UserInfoDB toMap() {
    return UserInfoDB(
      id: _id,
      displayName: _displayName,
      email: _email,
    );
  }

  /// Factory method to create UserInfoDB object from JSON.
  factory UserInfoDB.fromJson(Map<String, dynamic> map) {
    return UserInfoDB(
      id: map['id'] as int?,
      displayName: map['name'] as String?,
      email: map['email'] as String?,
    );
  }

  /// Converts UserInfoDB object to JSON string.
  String toJson() => json.encode(toMap());
}
