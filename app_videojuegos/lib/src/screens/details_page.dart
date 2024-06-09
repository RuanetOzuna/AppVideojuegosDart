import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';
import 'package:flutter_modulo1_fake_backend/recipe.dart';
import 'package:path/to/server_controller.dart'; // Import the ServerController class

class DetailsPage extends StatelessWidget {
  final Recipe recipe;
  final ServerController serverController;

  DetailsPage({required this.recipe, required this.serverController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              recipe.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Ingredients",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            for (var ingredient in recipe.ingredients)
              Text(
                ingredient,
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 8),
            Text(
              "Steps",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            for (var step in recipe.steps)
              Text(
                step,
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                serverController.addFavorite(recipe);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added to favorites!')),
                );
              },
              child: Text('Add to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
