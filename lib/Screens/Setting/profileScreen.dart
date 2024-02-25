import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/UserDto.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appbar.dart';

// Widget for the user profile screen
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Instances needed
  UserInfoProvider userInfoProvider = UserInfoProvider();
  UserDto userDto = UserDto();
  UserInfoDB userInfoDB = UserInfoDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'profile'),
      bottomNavigationBar: const TabBarBase(),
      body: Center(
        child: Column(
          children: [
            // User profile image and name
            Column(
              children: [
                const Icon(
                  Icons.person_2_rounded,
                  size: 150,
                ),
                const SizedBox(height: 10),
                Text(
                  '${userInfoDB.displayName}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // User email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'E-mail: ${userInfoDB.email}',
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
