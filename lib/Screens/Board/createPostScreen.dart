import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/Board/DioBoard.dart';
import 'package:flutter_sc/Model/Data/Board/BoardCreateDB.dart';
import 'package:flutter_sc/Model/common/DropDown/country.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/textFormField.dart';
import 'package:go_router/go_router.dart';

// Widget for creating a post
class CreatPostScreen extends StatefulWidget {
  final Function(String, String)? onDropdownValueChanged;

  const CreatPostScreen({Key? key, this.onDropdownValueChanged}) : super(key: key);

  @override
  State<CreatPostScreen> createState() => _CreatPostScreenState();
}

class _CreatPostScreenState extends State<CreatPostScreen> {
  final _formKey = GlobalKey<FormState>();

  // Widgets for inputting title and content
  TFF tffTitle = TFF(textFormField: TextFormField(), cnc: 'Title');
  TFF tffPost = TFF(textFormField: TextFormField(), cnc: 'Writing...');
  String dropdownValueLocal = maplocal.keys.first;

  @override
  Widget build(BuildContext context) {
    BoardCreateDB db = BoardCreateDB(
      title: tffTitle.toString(),
      contents: tffPost.toString(),
      location: dropdownValueLocal,
    );

    return Scaffold(
      appBar: const AppBarBase(title: 'Create Post'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Complete button
              Container(
                padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text('Post?'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  await db.saveBoardDB(
                                    tffTitle.toString(),
                                    tffPost.toString(),
                                    dropdownValueLocal,
                                  );
                                  context.go('/mainBoard');
                                },
                                child: const Text('Submit'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Complete'),
                ),
              ),
              // Title input
              SizedBox(
                width: 350,
                height: 80,
                child: tffTitle.textFormField,
              ),
              // Dropdown for selecting location
              Row(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
                  DropdownButton<String>(
                    focusColor: BODY_TEXT_COLOR,
                    dropdownColor: MAIN_TEXT_COLOR,
                    value: dropdownValueLocal,
                    hint: const Row(
                      children: [
                        Icon(Icons.arrow_drop_down),
                        Text('Local'),
                      ],
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValueLocal = value!;
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return maplocal.values.map<Widget>((String item) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          constraints: const BoxConstraints(minWidth: 100),
                          child: Text(
                            item,
                            style: const TextStyle(
                              color: PRIMARYCOLOR,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    items: maplocal.keys.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
                  ),
                ],
              ),
              // Content input
              SizedBox(
                width: 350,
                height: 500,
                child: tffPost.textFormField,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
