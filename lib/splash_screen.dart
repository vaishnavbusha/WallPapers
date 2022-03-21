// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, unnecessary_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpapers/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 625), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => MainScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11334E),
      //#11334E
      //053A64
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.93,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/icon_with_shadow.png'),
              ),
            ),
          ),
          Text(
            'from',
            style: TextStyle(
                fontFamily: 'typographica',
                color: Color(0xff90B4BA).withOpacity(0.5)),
          ),
          Text(
            'aquela studios',
            style: TextStyle(
                fontFamily: 'razed', color: Color(0xff90B4BA), fontSize: 23),
          ),
        ],
      ),
    );
  }
}
