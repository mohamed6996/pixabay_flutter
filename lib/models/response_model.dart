import 'package:pixabay_flut/models/response.dart';

class ResponseModel {
  String webformatURL;
  int downloads;
  int imageHeight;
  int imageWidth;
  String user;
  String userImageURL;

  ResponseModel(this.webformatURL, this.downloads, this.imageHeight,
      this.imageWidth, this.user, this.userImageURL);

  ResponseModel.fromResponse(Photo response)
      :webformatURL = response.webformatURL,
        downloads = response.downloads,
        imageHeight = response.imageHeight,
        imageWidth = response.imageWidth,
        user = response.user,
        userImageURL = response.userImageURL;


}