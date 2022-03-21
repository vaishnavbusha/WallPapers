// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/coming_soon_wallpapers.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
//'images/coming_soon_wallpapers.jpg'
