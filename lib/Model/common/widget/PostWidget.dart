import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Widget for displaying the post creation page.
class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
              const Text(
                'Free Board',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 180),
              TextButton(
                onPressed: () => context.go('/creatPost'), // Navigate to post creation page
                child: const Text('+ Creat Post'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
