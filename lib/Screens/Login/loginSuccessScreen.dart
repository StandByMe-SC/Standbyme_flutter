import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/UserDto.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:go_router/go_router.dart';

// Widget for the login success screen
class LoginSuccessScreen extends StatefulWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  // Instance of the user DTO
  UserDto userDto = UserDto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            const Icon(
              Icons.check_circle,
              color: MAIN_TEXT_COLOR,
              size: 150,
            ),
            const SizedBox(height: 50),
            const Text(
              'Your account is set up',
              style: TextStyle(fontSize: 30, color: MAIN_TEXT_COLOR),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MAIN_TEXT_COLOR,
                shadowColor: SHADOW_TEXT_COLOR,
                minimumSize: const Size(250, 50),
              ),
              onPressed: () {
                // Call method to retrieve login information and print it
                userDto.getLoginList();
                print('userinfo: ${userDto.getLoginList()}');
                print('userinfoToString: ${userDto.getLoginList().toString()}');
              },
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
