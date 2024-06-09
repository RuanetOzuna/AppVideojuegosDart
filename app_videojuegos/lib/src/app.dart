import 'package:app_videojuegos/src/screens/add_recipe_page.dart';
import 'package:app_videojuegos/src/screens/details_page.dart';
import 'package:app_videojuegos/src/screens/home_page.dart';
import 'package:app_videojuegos/src/screens/login_page.dart';
import 'package:app_videojuegos/src/screens/my_favorites_page.dart';
import 'package:app_videojuegos/src/screens/mys_recipes_page.dart';
import 'package:app_videojuegos/src/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';

import 'connection/server_controller.dart';

final ServerController _serverController = ServerController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple[300]),
        appBarTheme: const AppBarTheme(
          toolbarTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name) {
            case "/":
              return LoginPage(_serverController, context);
            case "/home":
              final User loggedUser = settings.arguments as User;
              _serverController.loggedUser = loggedUser;
              return HomePage(_serverController);
            case "/register":
              final User? loggedUser = settings.arguments as User?;
              return RegisterPage(
                _serverController,
                context,
                userToEdit: loggedUser,
              );
            case "/favorites":
              return MyFavoritesPage(_serverController);
            case "/my_recipes":
              return MyRecipesPage(_serverController);
            case "/add_recipe":
              return AddRecipePage(_serverController);
            case "/edit_recipe":
              final Recipe recipe = settings.arguments as Recipe;
              return AddRecipePage(
                _serverController,
                recipe: recipe,
              );
            case "/details":
              final Recipe recipe = settings.arguments as Recipe;
              return DetailsPage(
                recipe: recipe,
                serverController: _serverController,
              );
            default:
              return Scaffold(
                appBar: AppBar(title: Text('Error')),
                body: Center(child: Text('Página no encontrada')),
              );
          }
        });
      },
    );
  }
}

void main() {
  runApp(MyApp());
}
