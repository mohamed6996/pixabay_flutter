import 'package:flutter/material.dart';
import 'package:pixabay_flut/blocs/images_provider.dart';
import 'package:pixabay_flut/widgets/image_list.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImagesProvider(
      child: MaterialApp(
        title: "pixabay",
        home: ImageList(),
      ),
    );
  }
}
