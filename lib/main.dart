import 'package:flutter/material.dart';
import 'package:pixabay_flut/src/app.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Pixabay"),),
        body: MyApp(),
      )
  ));
}

