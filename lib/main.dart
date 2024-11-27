import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_56/dio_helper.dart';
import 'package:flutter_56/firebase_options.dart';
import 'package:flutter_56/login_screen.dart';
import 'package:flutter_56/news_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.initDioHelper();

  Map<String, dynamic> map = {
    "key": "value",
    "key1": "value1",
  };
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print(map["key"]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NewsScreen(),
    );
  }
}
