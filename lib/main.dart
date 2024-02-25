import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sc/Controller/Dto/FireBase/firebase_options.dart';
import 'package:flutter_sc/Controller/Router/goRouter.dart';
import 'package:flutter_sc/Model/Provider/UserInfoProvider.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:provider/provider.dart';

// App entry point
Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Initialize Firebase App Check
  await FirebaseAppCheck.instance.activate();
  
  // Run the app
  runApp(MyApp());
}

// Top-level widget of the app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
        // ChangeNotifierProvider(create: (_) => BoardProvider())
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Log In',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, primaryColor: PRIMARYCOLOR),
      ),
    );
  }
}

