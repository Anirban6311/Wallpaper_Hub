import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_app/views/widgets/SearchBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
      ),

      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: searchBar()
          ),
        ],
      ),
    );
  }
}

