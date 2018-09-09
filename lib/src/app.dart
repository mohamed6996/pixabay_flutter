import 'package:flutter/material.dart';
import 'package:pixabay_flut/repo/photo_repository.dart';
import 'package:pixabay_flut/widgets/image_list.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: new PhotoRepository().fetchPhotos(1),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('Press button to start');
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else {
                return ImageList(models: snapshot.data);
              }
          }
        });
  }
}

