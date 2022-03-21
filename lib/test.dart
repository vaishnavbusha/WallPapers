//import 'package:cached_network_image/cached_network_image.dart';
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wallpapers/networkcontroller.dart';
import 'package:wallpapers/wallpaper_page.dart';

final NetworkController _networkController = Get.find<NetworkController>();

class TestPage extends StatelessWidget {
  final String genre;
  TestPage({required this.genre});
  @override
  Widget build(BuildContext context) {
    try {
      return streamcontent();
    } catch (e) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.error_outline_rounded,
              size: 69,
              color: Colors.red,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.02,
            child: FittedBox(
              child: Text(
                'Check your internet connectivity.',
                style: TextStyle(color: Colors.red, fontFamily: 'SFPro'),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget streamcontent() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(genre).snapshots(),
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
                return StaggeredGridView.countBuilder(
                  key: PageStorageKey<String>(genre),
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(1, (index % 2 == 0) ? 1.9 : 1.5),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    String url = snapshot.data!.docs[index]['imgurl'];
                    String imglink = snapshot.data!.docs[index]['imglink'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<Null>(
                            builder: (context) => WallPaperPage(
                              index: index,
                              imageurl: url,
                              docid: snapshot.data!.docs[index].id,
                              imglink: imglink,
                            ),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: imagecard(url),
                        ),
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
    );
  }

  imagecard(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.red),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.015,
                  child: FittedBox(
                    child: Text(
                      'Check your internet connectivity.',
                      style: TextStyle(color: Colors.red, fontFamily: 'SFPro'),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        // Icon(
        //   Icons.error_outline_rounded,
        //   color: Colors.red,
        // ),
        );
  }
}
//snapshot.data.docs[index]['imgurl']
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                // ),

// CachedNetworkImage(
//                         imageUrl: url,
//                         fit: BoxFit.cover,
//                         errorWidget: (context, url, error) => Icon(
//                           Icons.error_outline_rounded,
//                           color: Colors.red,
//                         ),
//                         placeholder: (context, url) => Container(
//                           color: Colors.white12,
//                           child: Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.green,
//                             ),
//                           ),
//                         ),
//                       ),