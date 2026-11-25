import 'package:dio/dio.dart';
import 'package:movie/models/movie_model.dart';

class MovieService {
  static Dio dio = Dio();
  static Future<MovieModel> getMovies() async {
    try {
      Response response = await dio.get(
        "https://apimovie.runasp.net/api/Movies",
      );
      return MovieModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception("field to fetch data: ${dioError.message}");
    } catch (error) {
      throw Exception("error: ${error.toString()}");
    }
  }
}
