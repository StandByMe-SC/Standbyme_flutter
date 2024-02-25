import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/UserDto.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';
import 'package:flutter_sc/Model/Data/TokenKey.dart';
import 'package:flutter_sc/Model/common/client.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A class for handling Google authentication.
class GoogleAuth {
  /// Handles Google sign-in process, retrieves authenticated user information, and performs Firebase authentication.
  Future<dynamic> handleSignIn(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final UserDto userDto = UserDto();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      Map accountID = await account!.authHeaders;

      print('accountID: $accountID');

      final GoogleSignInAuthentication googleSignInAuth =
          await account.authentication;

      final AuthCredential googleCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuth.accessToken,
          idToken: googleSignInAuth.idToken);
      await prefs.setString('accessToken', googleCredential.accessToken!);
      final firebaseAuth = FirebaseAuth.instance;

      UserCredential user =
          await firebaseAuth.signInWithCredential(googleCredential);
      print("user ----$user");

      firebaseAuth.authStateChanges().listen((User? user) {
        if (user == null) {
          print("user is currently signed out");
        } else {
          print('user is signed in!');
        }
      });
      print(googleSignInAuth.accessToken);

      UserInfoDB userInfo = await userDto.fetchUser();

      return userInfo;
    } catch (E) {
      log(E.toString());
      print('An error occurred...');

      log(E.toString());
    }
  }
}
