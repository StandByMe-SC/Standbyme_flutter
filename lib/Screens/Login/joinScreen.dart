import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/DropDown/Gender.dart';
import 'package:flutter_sc/Model/common/DropDown/country.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:flutter_sc/Model/Data/UserInfo/UserInfoDB.dart';
import 'package:go_router/go_router.dart';

// Widget for the join screen
class JoinScreen extends StatefulWidget {
  final Function(String, String)? onDropdownValueChanged;

  const JoinScreen({Key? key, this.onDropdownValueChanged}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final _formKey = GlobalKey<FormState>();

  String dropdownValueCountry = listCountry.first;
  String dropdownValueGender = listGender.first;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Stand By Me',
                style: TextStyle(fontSize: 50, color: MAIN_TEXT_COLOR),
              ),
              const Text(
                'Join',
                style: TextStyle(fontSize: 40, color: MAIN_TEXT_COLOR),
              ),
              const SizedBox(height: 20),
              // Country selection dropdown button
              DropdownButton<String>(
                value: dropdownValueCountry,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValueCountry = value!;
                  });
                  widget.onDropdownValueChanged!(
                      dropdownValueCountry, dropdownValueGender);
                },
                items: listCountry.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              // Gender selection dropdown button
              DropdownButton<String>(
                value: dropdownValueGender,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValueGender = value!;
                  });
                  widget.onDropdownValueChanged!(
                      dropdownValueCountry, dropdownValueGender);
                },
                items: listGender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Join button
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                  if (form == null || !form.validate()) {
                    return;
                  }
                  // Handle join logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MAIN_TEXT_COLOR,
                  shadowColor: SHADOW_TEXT_COLOR,
                ),
                child: const Text('Join'),
              ),
              // Option to navigate to login if already a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: const Text('Log in'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
