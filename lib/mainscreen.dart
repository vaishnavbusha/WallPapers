// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpapers/navigation_bar.dart';
import 'package:wallpapers/networkcontroller.dart';

final NetworkController _networkController = Get.find<NetworkController>();

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scaler = MediaQuery.of(context).size;
    var textscaler = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: AppBar(
              centerTitle: true,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'WallPapers',
                  style: TextStyle(
                      fontFamily: 'SFPro',
                      color: Color(0xffFF9F0A),
                      fontSize: textscaler * 30,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
              ),
              elevation: 0.0,
              backgroundColor: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
      ),
      //mainbody
      body: Container(
        width: scaler.width,
        height: scaler.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_grey.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: // since appbar is placed under 'extendbodybehindappbar' because of that
              //...tagcontainers(),

              StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('collectionslist')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(
                  child: Text(
                    'failed to load wallpapers',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  return Obx(() {
                    if (_networkController.connectionstatus.value != 0) {
                      return GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: TagContainer(
                              tag: snapshot.data!.docs[index]['tag'],
                              imgurl: snapshot.data!.docs[index]['cover'],
                            ),
                          );
                        },
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.error_outline_rounded,
                              size: 60,
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: FittedBox(
                              child: Text(
                                'Check your internet connectivity.',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'SFPro',
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  });
              }
            },
          ),
        ),
      ),
    );
  }
}

class TagContainer extends StatelessWidget {
  //final int index;
  final String tag;
  final String imgurl;
  TagContainer({
    required this.tag,
    required this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    var scaler = MediaQuery.of(context).size;
    //var textscaler = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: EdgeInsets.only(top: scaler.height * 0.01),
      child: GestureDetector(
        onTap: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (_) => Navigationbar(
                wptag: tag.toLowerCase(),
              ),
            ),
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: scaler.width * 0.015),
              child: Container(
                width: scaler.width,
                height: scaler.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          imgurl,
                          errorListener: () => Center(
                            child: Icon(
                              Icons.error_outline_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white24),
              ),
            ),
            Positioned(
              width: scaler.width / 1.0295,
              bottom: -1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                  child: Container(
                    height: scaler.height / 16,
                    color: Colors.black.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          child: Obx(
                            () => Text(
                              _networkController.connectionstatus.value != 0
                                  ? tag
                                  : 'error',
                              style: TextStyle(
                                  fontFamily: 'SFPro',
                                  color: Color(0xff66B933),
                                  fontSize: scaler.width * 0.06,
                                  fontStyle: FontStyle.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Container(
//             width: width / 1.3,
//             height: height / 14,
//             decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(20)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   width: width / 1.3,
//                   height: height / 14,
//                   decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.99),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         'minimal',
//                         style: TextStyle(
//                             fontFamily: 'SFPro',
//                             color: Color(0xffFF9F0A),
//                             fontSize: 20,
//                             fontStyle: FontStyle.normal),
//                       ),
//                       Text(
//                         '$tagslength',
//                         style: TextStyle(
//                             fontFamily: 'SFPro',
//                             color: Color(0xffFF9F0A),
//                             fontSize: 20,
//                             fontStyle: FontStyle.normal),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: width / 8,
//                   height: height / 14,
//                   decoration: BoxDecoration(
//                       color: Colors.amber.withOpacity(0.99),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Icon(Icons.navigate_next_rounded, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

