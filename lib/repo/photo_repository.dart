import 'dart:async';
import 'dart:convert';

import 'package:pixabay_flut/models/response.dart';
import 'package:pixabay_flut/models/response_model.dart';
import 'package:pixabay_flut/repo/repository.dart';
import 'package:http/http.dart' show get;

const API_KEY = ""; // Replace with your own API key
const BASE_URL = "https://pixabay.com/api/";

class PhotoRepository implements Repository {
  @override
  Future<List<ResponseModel>> fetchPhotos(int pageNumber) async {
    String url = BASE_URL + "?key=$API_KEY&page=$pageNumber".toString();

    var res = await get(url);

    List<ResponseModel> models = Response
        .fromJson(jsonDecode(res.body))
        .photos
        .map((photo) => ResponseModel.fromResponse(photo))
        .toList();

    return models;
  }
}