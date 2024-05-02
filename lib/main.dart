import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}