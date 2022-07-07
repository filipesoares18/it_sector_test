import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itsector_test/photo_lib_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// Force Portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    /// Set the status bar of the device to transparent.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        // set Status bar color in Android devices.
        statusBarBrightness: Brightness.light,
        // set Status bar icons color in Android devices.
        statusBarIconBrightness: Brightness.light // set Status bar icons color in iOS devices.
    ));

    return MaterialApp(
      // Remove the banner debug.
      debugShowCheckedModeBanner: false,
      // Go to the first screen (Photo Library)
      home: PhotoLibScreen(),
    );
  }
}
