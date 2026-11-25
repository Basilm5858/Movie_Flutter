import 'package:flutter/material.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/screens/book_seat_page.dart';
import 'package:movie/widgets/customcard.dart';
import 'package:movie/widgets/seat_item.dart';
import 'package:provider/provider.dart';

class SeatsPage extends StatelessWidget {
  final Data model;

  const SeatsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(167, 39, 27, 211),
        centerTitle: true,
      ),
      body: Column(
        // Removed mainAxisSize: .min so Column fills the screen height
        children: [
          Customcard(model: model, clickable: false),
          Expanded(
            // Expanded is now a direct child of Column
            child: Consumer<MovieProvider>(
              builder: (context, value, child) {
                final data = value.model?.data;
                if (data == null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    value.getMovies();
                  });
                  return const Center(child: CircularProgressIndicator());
                }

                final movie = data.firstWhere((item) => item.id == model.id);
                final seats = movie.seats;

                if (seats.isEmpty) {
                  return const Center(child: Text('No seats available'));
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: seats.length,
                  itemBuilder: (context, index) {
                    final seat = seats[index];
                    return SeatItem(
                      seatNumber: seat.seatNumber,
                      status: seat.status,
                      onTap: () {
                        if (seat.status == "Available") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => BookSeatPage()),
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
