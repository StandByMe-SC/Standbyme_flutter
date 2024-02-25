import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/Data/Board/BoardCreateDB.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:flutter_sc/Model/common/widget/appbar.dart';

// Widget for editing my posts
class EditMyPostScreen extends StatefulWidget {
  const EditMyPostScreen({Key? key}) : super(key: key);

  @override
  State<EditMyPostScreen> createState() => _EditMyPostScreenState();
}

class _EditMyPostScreenState extends State<EditMyPostScreen> {
  // Instance of the board creation database
  BoardCreateDB boardCreateDB = BoardCreateDB();

  @override
  Widget build(BuildContext context) {
    // Call method to retrieve the list of posts
    boardCreateDB.getBoardList();
    
    return Scaffold(
      appBar: const AppBarBase(title: 'editMyPost'),
      bottomNavigationBar: const TabBarBase(),
      body: ListView(
        children: [
          Column(
            children: [
              // Displaying the list of my posts
              Text('My Posts: ${boardCreateDB.contents}'),
            ],
          ),
        ],
      ),
    );
  }
}
