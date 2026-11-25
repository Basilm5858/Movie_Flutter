import 'package:flutter/material.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/widgets/customcard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final providerObject = context.read<MovieProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(167, 39, 27, 211),
        centerTitle: true,
      ),
      body: Consumer<MovieProvider>(
        builder: (context, value, child) {
          final data = value.model?.data;
          if (data == null) {
            providerObject.getMovies();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Customcard(model: data[index], clickable: true);
              },
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
