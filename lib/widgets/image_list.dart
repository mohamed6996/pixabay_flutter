
import 'package:flutter/material.dart';
import 'package:pixabay_flut/blocs/images_bloc.dart';
import 'package:pixabay_flut/blocs/images_provider.dart';

class ImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ImagesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("pixabay"),
      ),
      body: ListBuilder(bloc: bloc),
    );
  }
}

class ListBuilder extends StatefulWidget {
  final ImagesBloc bloc;

  ListBuilder({this.bloc});

  @override
  _ListBuilderState createState() => _ListBuilderState(bloc: bloc);
}

class _ListBuilderState extends State<ListBuilder> {
  final ImagesBloc bloc;

  _ListBuilderState({this.bloc});

  int pageNumber = 1;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    bloc.fetchImages(pageNumber);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        pageNumber++;
        bloc.fetchImages(pageNumber);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildList(bloc, _scrollController);
  }
}

Widget buildList(ImagesBloc bloc, ScrollController scrollController) {
  return StreamBuilder(
    stream: bloc.imagesStream,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
          controller: scrollController,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return buildListTile(snapshot.data, index);
          });
    },
  );
}

Widget buildListTile(data, int index) {
  return ListTile(
    title: new Container(
      child: Column(
        children: <Widget>[
          Image.network(data[index].webformatURL),
          Text("image: ${index + 1}"),
        ],
      ),
    ),
  );
}
