// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) =>
    new Response((json['hits'] as List)
        ?.map((e) =>
            e == null ? null : new Photo.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$ResponseSerializerMixin {
  List<Photo> get photos;
  Map<String, dynamic> toJson() => <String, dynamic>{'hits': photos};
}

Photo _$PhotoFromJson(Map<String, dynamic> json) => new Photo(
    json['id'] as int,
    json['previewURL'] as String,
    json['webformatURL'] as String,
    json['largeImageURL'] as String,
    json['likes'] as int,
    json['favorites'] as int,
    json['downloads'] as int,
    json['imageHeight'] as int,
    json['imageWidth'] as int,
    json['user'] as String,
    json['userImageURL'] as String);

abstract class _$PhotoSerializerMixin {
  int get id;
  String get previewURL;
  String get webformatURL;
  String get largeImageURL;
  int get likes;
  int get favorites;
  int get downloads;
  int get imageHeight;
  int get imageWidth;
  String get user;
  String get userImageURL;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'previewURL': previewURL,
        'webformatURL': webformatURL,
        'largeImageURL': largeImageURL,
        'likes': likes,
        'favorites': favorites,
        'downloads': downloads,
        'imageHeight': imageHeight,
        'imageWidth': imageWidth,
        'user': user,
        'userImageURL': userImageURL
      };
}
