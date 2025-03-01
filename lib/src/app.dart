import 'package:flutter/material.dart';
import 'package:flutter_code4func_09_bloc_pattern/src/resources/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
