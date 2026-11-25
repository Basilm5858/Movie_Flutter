import 'package:dio/dio.dart';

class BookingService {
  static Dio dio = Dio();

  static Future<Response> bookingSeat({
    required int movieId,
    required int seatId,
    required String customerName,
  }) async {
    try {
      return await dio.post(
        "https://apimovie.runasp.net/api/Bookings",
        data: {
          "movieId": movieId,
          "seatId": seatId,
          "customerName": customerName,
        },
      );
    } on DioException catch (dioError) {
      throw Exception("field to fetch data: ${dioError.message}");
    } catch (error) {
      throw Exception("error: ${error.toString()}");
    }
  }

  static Future<Response> updateBook({required int bookingId}) async {
    try {
      return await dio.put(
        "https://apimovie.runasp.net/api/Bookings/$bookingId",
      );
    } on DioException catch (dioError) {
      throw Exception("field to fetch data: ${dioError.message}");
    } catch (error) {
      throw Exception("error: ${error.toString()}");
    }
  }

  static Future<Response> deleteBook({required int bookingId}) async {
    try {
      return await dio.delete(
        "https://apimovie.runasp.net/api/Bookings/$bookingId",
      );
    } on DioException catch (dioError) {
      throw Exception("field to fetch data: ${dioError.message}");
    } catch (error) {
      throw Exception("error: ${error.toString()}");
    }
  }
}
