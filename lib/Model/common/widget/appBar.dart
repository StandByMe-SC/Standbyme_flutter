import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Basic AppBar for use in the free board and 1:1 chat.
class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBase({Key? key, required this.title, this.center = false})
      : super(key: key);

  final String title;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return AppBarWithSearchSwitch(
      onChanged: (text) {},
      appBarBuilder: (context) {
        return AppBar(
          title: Text('STAND BY ME'), // Set the title
          actions: [
            const AppBarSearchButton(), // Search button
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.alarm), // Temporary action, replace with appropriate functionality
            ),
            IconButton(
              onPressed: () => context.go('/profile'), // Navigate to profile page
              icon: const Icon(Icons.person), // Profile icon
            )
          ],
        );
      },
      fieldHintText: 'Search', // Search field hint text
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70); // Set the preferred size of the app bar
}
