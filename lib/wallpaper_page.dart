// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, import_of_legacy_library_into_null_safe, deprecated_member_use
//import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class WallPaperPage extends StatelessWidget {
  final String imageurl;
  final int index;
  final String docid;
  WallPaperPage(
      {required this.index, required this.imageurl, required this.docid});

  @override
  Widget build(BuildContext context) {
    var scaler = MediaQuery.of(context).size;
    //var textscaler = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: scaler.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageurl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            showbottombuttons(context),
            // SelectableText(
            //   'Image id : ' + docid,
            //   style: TextStyle(
            //     color: Colors.white.withOpacity(0.3),
            //     fontFamily: 'SFPro',
            //     fontSize: textscaler * 18,
            //   ),
            // ),
            Container(
              height: scaler.width * 0.035,
              child: FittedBox(
                child: SelectableText(
                  'Image id : ' + docid,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontFamily: 'SFPro',
                    //fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget modalbottomsheet(BuildContext context) {
    var scaler = MediaQuery.of(context).size;
    //var textscaler = MediaQuery.of(context).textScaleFactor;
    return Wrap(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.height * 0.015, bottom: scaler.height * 0.015),
              child:
                  // Text(
                  //   'What would you like to do ?',
                  //   style: TextStyle(
                  //       fontFamily: 'SFPro',
                  //       color: Colors.white.withOpacity(0.9),
                  //       fontSize: textscaler * 35,
                  //       fontStyle: FontStyle.normal),
                  //   textAlign: TextAlign.center,
                  // ),
                  Container(
                //color: Colors.amber,
                height: scaler.height * 0.035,
                child: FittedBox(
                  child: Text(
                    'What would you like to do ?',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        color: Colors.white.withOpacity(0.9),
                        // fontSize: 25,
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                returnDialog(
                    context: context,
                    imageurl: imageurl,
                    screenplaceholder: 1,
                    setas: 'Set for home screen');
              },
              title:
                  // Text(
                  //   'Set for home screen',
                  //   style: TextStyle(
                  //       fontFamily: 'SFPro',
                  //       color: Color(0xff66B933),
                  //       fontSize: textscaler * 26,
                  //       fontStyle: FontStyle.normal),
                  //   textAlign: TextAlign.center,
                  // ),
                  Container(
                height: scaler.height * 0.025,
                child: FittedBox(
                  child: Text(
                    'Set for home screen',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        color: Color(0xff66B933),
                        //fontSize: 20,
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white24,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                returnDialog(
                    context: context,
                    imageurl: imageurl,
                    screenplaceholder: 2,
                    setas: 'Set for lock screen');
              },
              title:
                  // Text(
                  //   'Set for lock screen',
                  //   style: TextStyle(
                  //       fontFamily: 'SFPro',
                  //       color: Color(0xff66B933),
                  //       fontSize: textscaler * 26,
                  //       fontStyle: FontStyle.normal),
                  //   textAlign: TextAlign.center,
                  // ),
                  Container(
                height: scaler.height * 0.025,
                child: FittedBox(
                  child: Text(
                    'Set for lock screen',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        color: Color(0xff66B933),
                        //fontSize: 20,
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              horizontalTitleGap: 1,
            ),
            Divider(
              height: 1,
              color: Colors.white24,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                returnDialog(
                    context: context,
                    imageurl: imageurl,
                    screenplaceholder: 3,
                    setas: 'Set for both screens');
              },
              title:
                  //  Text(
                  //   'Set for both screens',
                  //   style: TextStyle(
                  //       fontFamily: 'SFPro',
                  //       color: Color(0xff66B933),
                  //       fontSize: textscaler * 26,
                  //       fontStyle: FontStyle.normal),
                  //   textAlign: TextAlign.center,
                  // ),
                  Container(
                height: scaler.height * 0.025,
                child: FittedBox(
                  child: Text(
                    'Set for both screens',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        color: Color(0xff66B933),
                        //fontSize: 20,
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              horizontalTitleGap: 1,
            ),
            Divider(
              height: 1,
              color: Colors.white24,
            ),
            ListTile(
              onTap: () async {
                try {
                  var isdone = false;
                  Uint8List bytes =
                      (await NetworkAssetBundle(Uri.parse(imageurl))
                              .load(imageurl))
                          .buffer
                          .asUint8List();
                  await ImageGallerySaver.saveImage(bytes);
                  isdone = true;
                  if (isdone) {
                    final snackbar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content:
                          // Text(
                          //   'Download Completed.',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontFamily: 'SFPro',
                          //     fontSize: textscaler * 17,
                          //   ),
                          //   textAlign: TextAlign.center,
                          // ),
                          FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Download Completed.',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFPro',
                            //fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      backgroundColor: Colors.green.withOpacity(0.8),
                      duration: Duration(seconds: 2),
                      margin: EdgeInsets.all(20),
                      dismissDirection: DismissDirection.horizontal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                } catch (e) {
                  final snackbar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content:
                        // Text(
                        //   'Error downloading, please check your Internet connectivity.',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontFamily: 'SFPro',
                        //     fontSize: textscaler * 17,
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),
                        FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Error downloading, please check your Internet connectivity.',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SFPro',
                          //fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red.withOpacity(0.8),
                    duration: Duration(seconds: 4),
                    margin: EdgeInsets.all(20),
                    dismissDirection: DismissDirection.horizontal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  print(e);
                }
                // final directory = await getExternalStorageDirectory();
                // final myImagePath = '${directory!.path}/WallPapersApp';
                // await new Directory(myImagePath).create();
                // final file = new File('$myImagePath/$name.jpg')
                //   ..writeAsBytesSync(bytes, mode: FileMode.write);
                // print('ok');
                Navigator.pop(context);
              },
              title:
                  // Text(
                  //   'Download',
                  //   style: TextStyle(
                  //       fontFamily: 'SFPro',
                  //       color: Color(0xff66B933),
                  //       fontSize: textscaler * 26,
                  //       fontStyle: FontStyle.normal),
                  //   textAlign: TextAlign.center,
                  // ),
                  Container(
                height: scaler.height * 0.025,
                child: FittedBox(
                  child: Text(
                    'Download',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        color: Color(0xff66B933),
                        //fontSize: 20,
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              horizontalTitleGap: 1,
            ),
          ],
        ),
      ],
    );
  }

  showbottombuttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:
              button(icon: Icons.arrow_back_ios_new_rounded, context: context),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () => showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            backgroundColor: Colors.black.withOpacity(0.9),
            context: context,
            builder: (context) => modalbottomsheet(context),
          ),
          child: button(icon: Icons.download_rounded, context: context),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () => sharebutton(imageurl),
          child: button(icon: Icons.share_rounded, context: context),
        ),
        // GestureDetector(
        //   onTap: () => showDialog(
        //     context: context,
        //     builder: (context) => ExitConfirmationDialog(
        //       setas: 'home screen',
        //     ),
        //   ),
        //   child: button(icon: Icons.texture_sharp),
        // ),
      ],
    );
  }
}

sharebutton(imageurl) async {
  var cachedimage = await DefaultCacheManager().getSingleFile(imageurl);
  await Share.shareFiles([cachedimage.path],
      text: 'Take a look at this pic from wallpapers app...👀');
}

Future<void> returnDialog(
    {required BuildContext context,
    required String imageurl,
    required String setas,
    required int screenplaceholder}) async {
  var cachedimage = await DefaultCacheManager().getSingleFile(imageurl);
  var scaler = MediaQuery.of(context).size;
  //var textscaler = MediaQuery.of(context).textScaleFactor;
  showDialog(
    context: context,
    builder: (context) => Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(0.9)),
        height: scaler.height / 5.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: scaler.height * 0.01),
              child:
                  // Text(
                  //   setas,
                  //   style: TextStyle(
                  //       fontFamily: 'SFPro',
                  //       color: Color(0xff66B933),
                  //       fontSize: textscaler * 32.5,
                  //       fontStyle: FontStyle.normal),
                  // ),
                  Container(
                height: scaler.height * 0.035,
                child: FittedBox(
                  alignment: Alignment.center,
                  child: Text(
                    setas,
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        color: Color(0xff66B933),
                        // fontSize: 25,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: scaler.height * 0.01, top: scaler.height * 0.005),
              child:
                  // Text(
                  //   'NOTE: click on \'yes\' to update wallpaper.',
                  //   style: TextStyle(
                  //       fontFamily: 'SFPro',
                  //       color: Color(0xff66B933).withOpacity(0.6),
                  //       fontSize: textscaler * 19,
                  //       fontStyle: FontStyle.italic),
                  // ),
                  Container(
                height: MediaQuery.of(context).size.height * 0.02,
                child: FittedBox(
                  child: Text(
                    'NOTE: click on \'yes\' to update wallpaper.',
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        color: Color(0xff66B933).withOpacity(0.6),
                        //fontSize: 13,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white24,
              indent: 20,
              endIndent: 20,
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  highlightColor: Colors.white10,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      // Text(
                      //   'NO',
                      //   style: TextStyle(
                      //     fontFamily: 'SFPro',
                      //     color: Color(0xff66B933),
                      //     fontSize: textscaler * 20,
                      //   ),
                      // ),
                      Container(
                    height: MediaQuery.of(context).size.height * 0.022,
                    child: FittedBox(
                      child: Text(
                        'NO',
                        style: TextStyle(
                          fontFamily: 'SFPro',
                          color: Color(0xff66B933),
                          //fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.white24,
                    thickness: 0.5,
                    indent: 10,
                    endIndent: 9,
                  ),
                ),
                FlatButton(
                  highlightColor: Colors.white10,
                  onPressed: () async {
                    var croppedimage;
                    croppedimage = await ImageCropper().cropImage(
                      sourcePath: cachedimage.path,
                      aspectRatio: CropAspectRatio(
                        ratioX: MediaQuery.of(context).size.width,
                        ratioY: MediaQuery.of(context).size.height,
                      ),
                      androidUiSettings: AndroidUiSettings(
                        cropFrameColor: Colors.white54,
                        cropGridColor: Colors.white38,
                        statusBarColor: Colors.black,
                        toolbarColor: Colors.black,
                        toolbarWidgetColor: Color(0xff2afeb7),
                        backgroundColor: Colors.black,
                        toolbarTitle: 'Set Image',
                        hideBottomControls: true,
                      ),
                    );
                    //print(croppedimage);
                    if (croppedimage != null) {
                      await WallpaperManager.setWallpaperFromFile(
                          croppedimage.path, screenplaceholder);
                      final snackbar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content:
                            // Text(
                            //   'Screen Updated.',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontFamily: 'SFPro',
                            //     fontSize: textscaler * 17,
                            //   ),
                            //   textAlign: TextAlign.center,
                            // ),
                            FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Screen Updated.',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SFPro',
                              //fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        backgroundColor: Colors.green.withOpacity(0.8),
                        duration: Duration(seconds: 2),
                        margin: EdgeInsets.all(20),
                        dismissDirection: DismissDirection.horizontal,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                    Navigator.of(context).pop();
                  },
                  child:
                      //  Text(
                      //   'YES',
                      //   style: TextStyle(
                      //     fontFamily: 'SFPro',
                      //     color: Color(0xff66B933),
                      //     fontSize: textscaler * 20,
                      //   ),
                      // ),
                      Container(
                    height: MediaQuery.of(context).size.height * 0.022,
                    child: FittedBox(
                      child: Text(
                        'YES',
                        style: TextStyle(
                          fontFamily: 'SFPro',
                          color: Color(0xff66B933),
                          //fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget button({required IconData? icon, required BuildContext context}) {
  var scaler = MediaQuery.of(context).size;
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
      ),
      child: FittedBox(
        child: Icon(
          icon,
          size: scaler.width * 0.05,
          color: Color(0xff32D74B),
        ),
      ),
    ),
  );
} // if u want glassmorphism effect for buttons wrap "Icon" widget with backdropfilter with sigma value 30.

// Future<void> setwallpaper(
  //     {required BuildContext ctx, required String imageurl}) async {
  //   var cachedimage = await DefaultCacheManager().getSingleFile(imageurl);
  //   showDialog(
  //     context: ctx,
  //     builder: (context) => (AlertDialog(
  //       //backgroundColor: Colors.black.withOpacity(0.85),
  //       backgroundColor: Colors.yellow,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //           top: Radius.circular(25),
  //           bottom: Radius.circular(25),
  //         ),
  //       ),
  //       actionsAlignment: MainAxisAlignment.center,
  //       title: Text(
  //         'set image',
  //         style: TextStyle(
  //             fontFamily: 'SFPro',
  //             color: Colors.white.withOpacity(0.9),
  //             fontSize: 25,
  //             fontStyle: FontStyle.normal),
  //         textAlign: TextAlign.center,
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child: Text('No'),
  //         ),
  //         TextButton(
  //           onPressed: () async {
  //             var croppedimage;
  //             croppedimage = await ImageCropper().cropImage(
  //               sourcePath: cachedimage.path,
  //               aspectRatio: CropAspectRatio(
  //                 ratioX: MediaQuery.of(context).size.width,
  //                 ratioY: MediaQuery.of(context).size.height,
  //               ),
  //               androidUiSettings: AndroidUiSettings(
  //                 cropFrameColor: Colors.white54,
  //                 cropGridColor: Colors.white38,
  //                 statusBarColor: Colors.black,
  //                 toolbarColor: Colors.black,
  //                 toolbarWidgetColor: Color(0xff2afeb7),
  //                 backgroundColor: Colors.black,
  //                 toolbarTitle: 'Crop Image',
  //                 hideBottomControls: true,
  //               ),
  //             );
  //             if (croppedimage != null) {
  //               await WallpaperManager.setWallpaperFromFile(
  //                   croppedimage.path, WallpaperManager.HOME_SCREEN);
  //             }
  //             Navigator.of(context).pop();
  //           },
  //           child: Text('Yes'),
  //         )
  //       ],
  //     )),
  //   );
  // }
