import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/Board/DioBoard.dart';
import 'package:flutter_sc/Model/Data/Board/BoardCreateDB.dart';
import 'package:flutter_sc/Model/common/widget/appBar.dart';
import 'package:flutter_sc/Model/common/widget/TabBar.dart';
import 'package:go_router/go_router.dart';

// Widget for the main board screen
class MainBoardScreen extends StatefulWidget {
  const MainBoardScreen({Key? key}) : super(key: key);

  @override
  State<MainBoardScreen> createState() => _MainBoardScreenState();
}

class _MainBoardScreenState extends State<MainBoardScreen> {
  late Future<List<dynamic>> boardDetailsDb;
  final BoardCreateDB boardCreateDB = BoardCreateDB();

  @override
  void initState() {
    super.initState();
    // Perform asynchronous task to fetch posts
    boardDetailsDb = boardCreateDB.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBase(title: 'Board'),
      body: FutureBuilder(
        future: boardDetailsDb,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display loading indicator while data is being fetched
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display error message if an error occurs during data fetching
            return const Center(child: Text("Error!"));
          } else if (snapshot.hasData) {
            // Display list of posts once data fetching is complete
            List<dynamic> posts = snapshot.data!;
            return ListView.separated(
              itemBuilder: (context, index) {
                if (posts[index] != null) {
                  return ListTile(
                    title: Text(
                      'Title: ${posts[index]["title"]}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text("Contents: ${posts[index]["contents"]}"),
                  );
                } else {
                  return const ListTile(
                    title: Text("Error"),
                    subtitle: Text("Error"),
                  );
                }
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: posts.length,
            );
          } else {
            // Display message when there is no data and no error
            return const Center(child: Text("No Data!"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to create post screen
          context.go('/creatPost');
        },
        child: const Icon(Icons.screenshot_rounded),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
