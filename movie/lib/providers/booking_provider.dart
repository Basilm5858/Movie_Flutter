import 'package:flutter/foundation.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/services/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  MovieModel? model;

  Future<void> bookingSet({
    required int movieId,
    required int seatId,
    required String customerName,
  }) async {
    await BookingService.bookingSeat(
      movieId: movieId,
      seatId: seatId,
      customerName: customerName,
    );
    notifyListeners();
  }

  Future<void> updatebooking({required int bookingId}) async {
    await BookingService.updateBook(bookingId: bookingId);
    notifyListeners();
  }

  Future<void> deletebooking({required int bookingId}) async {
    await BookingService.deleteBook(bookingId: bookingId);
    notifyListeners();
  }
}
