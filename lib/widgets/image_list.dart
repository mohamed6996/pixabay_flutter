import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pixabay_flut/models/response_model.dart';
import 'package:pixabay_flut/repo/photo_repository.dart';
import 'package:pixabay_flut/widgets/image_list.dart';

class ImageList extends StatefulWidget {
  final List<ResponseModel> models;

  ImageList({Key key, this.models}) : super(key: key);

  @override
  _ImageListState createState() => new _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<ResponseModel> models;
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  int currentPage = 1;

  @override
  void initState() {
    this.models = widget.models;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        currentPage++;
        new PhotoRepository().fetchPhotos(currentPage).then((newList) {
          setState(() {
            currentPage;
            models.addAll(newList);
            print("current: $currentPage");
          });
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildListView(models, _scrollController);
  }
}

Widget buildListView(
    List<ResponseModel> models, ScrollController scrollController) {
  return new Container(
    child: ListView.builder(
        controller: scrollController,
        itemCount: models.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: new Container(
              child: Column(
                children: <Widget>[
                  Image.network(models[index].webformatURL),
                  Text("image: ${index + 1}"),
                ],
              ),
            ),
          );
        }),
  );
}
