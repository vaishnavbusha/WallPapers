// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

//import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpapers/test.dart';
//import 'package:wallpapers/test.dart';
//import 'package:wallpapers/wallpaper_page.dart';

//import 'scrollable_images.dart';
final bucketglobal = PageStorageBucket();

class HomePage extends StatelessWidget {
  final String wptag;
  HomePage({required this.wptag});
  final backgroundimage_blue = "images/background_blue.jpg";
  final backgroundimage_grey = "images/background_grey.jpg";
  final bool isblue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: customappbar(context),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //NavigationBar(),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background_grey.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Text(''),
              ),
            ), //-- for normal use
            PageStorage(
              bucket: bucketglobal,
              child: TestPage(
                genre: wptag,
              ),
            ),
          ],
        ));
  }

  PreferredSizeWidget customappbar(ctx) {
    return PreferredSize(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: AppBar(
            centerTitle: true,
            leading: GestureDetector(
                onTap: () => Navigator.pop(ctx),
                child: Icon(Icons.arrow_back_ios_new)),
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                wptag,
                style: TextStyle(
                    fontFamily: 'SFPro',
                    color: Color(0xffFF9F0A),
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                textAlign: TextAlign.center,
              ),
            ),
            elevation: 0.0,
            backgroundColor: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
      preferredSize: Size(
        double.infinity,
        56.0,
      ),
    );
  }
}
