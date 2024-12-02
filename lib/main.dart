import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_56/core/bloc_observer/bloc_observer.dart';
import 'package:flutter_56/core/network/local/shared_preference.dart';
import 'package:flutter_56/cubit/logic_cubit.dart';
import 'package:flutter_56/firebase_options.dart';
import 'package:flutter_56/notification.dart';
import 'package:flutter_56/screens/login_screen.dart';
import 'package:flutter_56/screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.initSharedPreferenceHelper();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  await FirebaseMessaging.instance.getToken().then((value) {
    log("object $value");
  });

  NotificationLocal.init();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: "firebase",
        channelName: "firebase",
        channelDescription: "notification for firebase",
        importance: NotificationImportance.High,
        playSound: true,
        channelShowBadge: true,
        enableVibration: true,
        enableLights: true,
      )
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LogicCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SharedPreferenceHelper.getData(key: "uidUser") != null
            ? const ProfileScreen()
            : const LoginScreen(),
      ),
    );
  }
}
