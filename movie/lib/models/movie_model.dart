class MovieModel {
  final List<Data> data;

  new({required this.data});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final tempList = json["data"]
        .map<Data>(
          (item) => Data(
            id: item["id"],
            name: item["name"],
            poster: item["poster"],
            showDate: item["showDate"],
            showTime: item["showTime"],
            seats: item["seats"]
                .map<Seat>(
                  (seat) => Seat(
                    seatId: seat["seatId"],
                    bookingId: seat["bookingId"],
                    seatNumber: seat["seatNumber"],
                    status: seat["status"],
                    customerName: seat["customerName"],
                  ),
                )
                .toList(),
          ),
        )
        .toList();
    return MovieModel(data: tempList);
  }
}

class Data {
  final int id;
  final String name;
  final String poster;
  final String showDate;
  final String showTime;
  final List<Seat> seats;

  new({
    required this.id,
    required this.name,
    required this.poster,
    required this.showDate,
    required this.showTime,
    required this.seats,
  });
}

class Seat {
  final int seatId;
  final int? bookingId;
  final String seatNumber;
  final String status;
  final String? customerName;

  new({
    required this.seatId,
    this.bookingId,
    required this.seatNumber,
    required this.status,
    this.customerName,
  });
}
