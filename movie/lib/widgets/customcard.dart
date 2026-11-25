import 'package:flutter/material.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/screens/seats_page.dart';

class Customcard extends StatelessWidget {
  final Data model;
  final bool clickable;

  const Customcard({super.key, required this.model, required this.clickable});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !clickable
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeatsPage(model: model),
                ),
              );
            },
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                model.poster,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image),
                width: 100,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    model.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(children: [Icon(Icons.event), Text(model.showDate)]),
                  SizedBox(height: 5),

                  Row(children: [Icon(Icons.schedule), Text(model.showDate)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
