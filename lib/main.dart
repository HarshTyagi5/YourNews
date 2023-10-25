import 'package:flutter/material.dart';
import 'package:tech_news/pages/home.dart';
import 'package:tech_news/utils/colors.dart';

void main() => runApp( const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: AppColors.primary),
      home:  Home(),
    );
  }
}