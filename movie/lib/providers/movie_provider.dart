import 'package:flutter/foundation.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  MovieModel? model;
  Future<void> getMovies() async {
    model = await MovieService.getMovies();
    notifyListeners();
  }
}
