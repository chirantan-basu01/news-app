import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Search Page"),
      ),
    );
  }
}
