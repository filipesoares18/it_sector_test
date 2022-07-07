// Flutter & Dart
import 'package:flutter/material.dart';

// Internal Project
import 'package:itsector_test/config/colors.dart';
import 'package:itsector_test/config/strings.dart';

class PhotoDetailScreen extends StatefulWidget {
  @required
  final int photoId;
  @required
  final String title;
  @required
  final String url;

  PhotoDetailScreen(
      {required this.photoId, required this.title, required this.url});

  @override
  _PhotoDetailScreenState createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar configuration.
      appBar: AppBar(
        backgroundColor: appBarBackground,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          Strings.titlePhotoId + widget.photoId.toString(),
          textScaleFactor: 0.7,
          style: TextStyle(fontSize: 30, color: appBarTextColor),
        ),
      ),
      backgroundColor: scaffoldBackground, //Background Color
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image with URL and text from the first screen.
              Image.network(widget.url),
              SizedBox(height: 20),
              Text(
                widget.title,
                textScaleFactor: 0.7,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
