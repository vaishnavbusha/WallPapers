package com.aquelastudios.wallpapers;
import io.flutter.embedding.android.FlutterActivity;
public class MainActivity extends FlutterActivity {
}

// import androidx.annotation.NonNull;
// import androidx.annotation.RequiresApi;

// import io.flutter.embedding.android.FlutterActivity;
// import io.flutter.embedding.engine.FlutterEngine;
// import io.flutter.plugin.common.MethodCall;
// import io.flutter.plugin.common.MethodChannel;

// import android.os.Build;
// import android.os.Bundle;
// import android.app.WallpaperManager;
// import android.graphics.Bitmap;
// import android.graphics.BitmapFactory;
// import java.io.File;
// import android.content.Intent;
// import android.net.Uri;
// import java.io.IOException;
// import android.app.Activity;
// import java.util.*;

// public class MainActivity{
//     private static final String CHANNEL = "com.aquelastudios.wallpaperz/wallpaperz";

//a     @RequiresApi(api = Build.VERSION_CODES.N)
//     @Override
//     public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {

//         super.configureFlutterEngine(flutterEngine);
//         new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//                 .setMethodCallHandler(
//                         (call, result) ->{

//                             String data= call.arguments();
//                             String[] str = data.split(" ");
//                             //File imgFile = call.arguments();
//                             if(call.method.equals("setwall")){
//                                 File imgFile = new File(this.getApplicationContext().getCacheDir(),str[0]);
//                                 Bitmap bitmap = BitmapFactory.decodeFile(imgFile.getAbsolutePath());
//                                 WallpaperManager wallpapermanager;
//                                 wallpapermanager= WallpaperManager.getInstance(this);
//                                 try{
//                                     switch (str[1]) {
//                                         case "home":
//                                             wallpapermanager.setBitmap(bitmap, null, true, WallpaperManager.FLAG_SYSTEM);
//                                             break;
//                                         case "lock":
//                                             wallpapermanager.setBitmap(bitmap, null, true, WallpaperManager.FLAG_LOCK);
//                                             break;
//                                         case "both":
//                                             wallpapermanager.setBitmap(bitmap);
//                                             break;
//                                     }
//                                     result.success("success");
//                                 }catch(IOException e){
//                                     result.success("failed");
//                                 }

//                             }
//                         }
//                 );
//     }
// }