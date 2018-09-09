import 'dart:async';
import 'package:pixabay_flut/models/response_model.dart';


abstract class Repository {
  Future<List<ResponseModel>> fetchPhotos(int pageNumber);
}