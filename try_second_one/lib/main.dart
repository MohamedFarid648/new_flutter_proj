import 'package:flutter/material.dart';
import 'package:try_second_one/views/home_view.dart';
import 'package:try_second_one/views/login_view.dart';

import 'views/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/register': (context) => const RegisterView(),
        '/login': (context) => const LoginView(),
      },
    );
  }
}
