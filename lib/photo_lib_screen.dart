// Flutter & Dart
import 'dart:convert';
import 'package:flutter/material.dart';

// Internal Project
import 'package:itsector_test/config/colors.dart';
import 'package:itsector_test/config/strings.dart';
import 'package:itsector_test/models/Photo.dart';
import 'package:itsector_test/photo_detail.dart';

// External Packages
import 'package:http/http.dart' as http;

class PhotoLibScreen extends StatefulWidget {
  @override
  _PhotoLibScreenState createState() => _PhotoLibScreenState();
}

class _PhotoLibScreenState extends State<PhotoLibScreen> {
  // Create the empty List
  List photos = [];

  Future getPhotos() async {
    // Create http Client;
    var client = http.Client();

    // Parse the URL
    var uri = Uri.parse(Strings.urlApiPhotos);

    // Response of the request.
    var response = await client.get(uri);

    // Decode the response
    var responseContent = jsonDecode(response.body);

    // Add every photo in the list photos
    for (var photo in responseContent) {
      Photo _photo = Photo(
          albumId: photo["albumId"],
          id: photo["id"],
          title: photo["title"],
          url: photo["url"],
          thumbnailUrl: photo["thumbnailUrl"]);
      photos.add(_photo);
    }

    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar configuration.
      appBar: AppBar(
        backgroundColor: appBarBackground,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          Strings.appBarTitle,
          textScaleFactor: 0.7,
          style: TextStyle(fontSize: 30, color: appBarTextColor),
        ),
      ),
      backgroundColor: scaffoldBackground, //Background Color
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          // Create FutureBuilder for the method getPhotos() to get all the
          // photos from the API.
          child: FutureBuilder(
            future: getPhotos(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                // Create GridView for the Photos.
                return GridView.builder(
                    itemCount: photos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 4 columns of images
                      childAspectRatio: 1,
                      mainAxisSpacing: 10, // vertical spacing
                      crossAxisSpacing: 10, // horizontal spacing
                    ),
                    itemBuilder: (context, i) {
                      // Create GestureDetector for when the click happen on one
                      // color, go to another screen with the detail of that color.
                      return GestureDetector(
                        child: Image.network(photos[i].thumbnailUrl),
                        onTap: () {
                          // Go to the PhotoDetail screen.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhotoDetailScreen(
                                    photoId: photos[i].id,
                                    title: photos[i].title,
                                    url: photos[i].url)),
                          );
                        },
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
