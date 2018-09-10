import 'package:flutter/material.dart';
import 'package:pixabay_flut/blocs/images_bloc.dart';

class ImagesProvider extends InheritedWidget {
  final ImagesBloc imagesBloc;

  ImagesProvider({Key key, Widget child})
      : imagesBloc = ImagesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ImagesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ImagesProvider)
            as ImagesProvider)
        .imagesBloc;
  }
}
