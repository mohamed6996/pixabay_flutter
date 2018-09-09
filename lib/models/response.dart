import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class Response extends Object  with _$ResponseSerializerMixin {

  @JsonKey(name:'hits')
  final List<Photo> photos;

  Response(this.photos);
  factory Response.fromJson(Map<String, dynamic> json)=>_$ResponseFromJson(json);
}

@JsonSerializable()
class Photo extends Object with _$PhotoSerializerMixin{
  int id;
  String previewURL;
  String webformatURL;
  String largeImageURL;
  int likes;
  int favorites;
  int downloads;
  int imageHeight;
  int imageWidth;
  String user;
  String userImageURL;

  Photo(this.id, this.previewURL, this.webformatURL, this.largeImageURL,
      this.likes, this.favorites, this.downloads, this.imageHeight,
      this.imageWidth, this.user, this.userImageURL);

  factory Photo.fromJson(Map<String, dynamic> json) =>_$PhotoFromJson(json);



}