// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_required_param, avoid_print

import 'dart:ui';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wallpapers/home_page.dart';
import 'package:wallpapers/trendingpage.dart';
//import 'package:wallpapers/glassmorphism.dart';

class Navigationbar extends StatefulWidget {
  final String wptag;
  Navigationbar({required this.wptag});
  @override
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scaler = MediaQuery.of(context).size;
    //var textscaler = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: tabcontroller,
            children: [
              HomePage(
                wptag: widget.wptag,
              ),
              Trending()
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: scaler.height * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: scaler.width / 1.5,
                    decoration: BoxDecoration(
                      color: Color(0xff000000),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Center(
                                child: TabBar(
                                  controller: tabcontroller,
                                  unselectedLabelColor: Color(0xff2C8039),
                                  labelColor: Color(0xff32D74B),
                                  labelStyle: TextStyle(
                                      fontFamily: 'SFPro',
                                      color: Color(0xffFF9F0A),
                                      fontSize: scaler.width * 0.04,
                                      fontStyle: FontStyle.normal),
                                  indicator: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  tabs: [
                                    Tab(text: 'Home'),
                                    Tab(text: 'Trending'),
                                  ],
                                ),
                              ),
                            ),
                            //Positioned.fill(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
