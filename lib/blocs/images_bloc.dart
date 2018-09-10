import 'package:rxdart/rxdart.dart';
import 'package:pixabay_flut/models/response_model.dart';
import 'package:pixabay_flut/repo/photo_repository.dart';

class ImagesBloc {
  final _repository = PhotoRepository();

  final _image_list_controller = PublishSubject<List<ResponseModel>>();

  Observable<List<ResponseModel>> get imagesStream => _image_list_controller.stream;

  List<ResponseModel> _models = [];

  fetchImages(int pageNumber) async {
    await _repository.fetchPhotos(pageNumber).then((newList) {
      _models.addAll(newList);
      _image_list_controller.sink.add(_models);
    });
  }

  dispose() {
    _image_list_controller.close();
  }
}
