import 'package:app_videojuegos/src/components/my_drawer.dart';
import 'package:app_videojuegos/src/components/recipe_widget.dart';
import 'package:app_videojuegos/src/connection/server_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';

class MyFavoritesPage extends StatefulWidget {
  final ServerController serverController;

  MyFavoritesPage(this.serverController, {Key? key}) : super(key: key);

  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis favoritos"),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: widget.serverController.getFavoritesList(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info,
                      size: 120,
                      color: Colors.purple[300],
                    ),
                    Text(
                      "Su listado de favoritos está vacío, para poder agregar a favoritos simplemente seleccione el ícono de favorito(corazón) en la receta que desee agregar",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          } else {
            final list = snapshot.data!;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                Recipe recipe = list[index];

                return RecipeWidget(
                  recipe: recipe,
                  serverController: widget.serverController,
                  onChange: () {
                    setState(() {});
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
