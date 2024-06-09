library flutter_modulo1_fake_backend;

import 'package:flutter_modulo1_fake_backend/data_init.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';
import 'package:flutter_modulo1_fake_backend/recipe.dart';
import 'package:flutter_modulo1_fake_backend/user.dart';

// Lectura de datos
Future<List<User>> getUsers() async {
  await Future.delayed(Duration(seconds: 3));
  return users;
}

Future<List<Recipe>> getRecipes() async {
  await Future.delayed(Duration(seconds: 3));
  return recipes;
}

Future<List<Recipe>> getFavorites() async {
  await Future.delayed(Duration(seconds: 3));
  return favorites;
}

Future<bool> isFavorite(Recipe recipeToCheck) async {
  await Future.delayed(Duration(milliseconds: 500));
  for (Recipe recipe in favorites) {
    if (recipe == recipeToCheck) {
      return true;
    }
  }
  return false;
}

Future<List<Recipe>> getUserRecipes(User user) async {
  await Future.delayed(Duration(seconds: 3));
  return recipes.where((recipe) {
    return recipe.user.id == user.id;
  }).toList();
}

// Creación de datos
Future<Recipe> addRecipe(Recipe nRecipe) async {
  nRecipe = nRecipe.copyWith(id: recipes.length + 1);
  recipes.add(nRecipe);
  return nRecipe;
}

Future<Recipe> addFavorite(Recipe nFavorite) async {
  favorites.add(nFavorite);
  return nFavorite;
}

Future<bool> addUser(User nUser) async {
  nUser = nUser.copyWith(id: users.length + 1);
  users.add(nUser);
  return true;
}

Future<bool> updateUser(User user) async {
  int pos = users.indexWhere((u) => u.id == user.id);
  if (pos >= 0) {
    users[pos] = user;
  }
  return true;
}

Future<bool> updateRecipe(Recipe receta) async {
  int pos = recipes.indexWhere((r) => r.id == receta.id);
  if (pos >= 0) {
    recipes[pos] = receta;
  }
  return true;
}

Future<bool> deleteFavorite(Recipe favoriteRecipe) async {
  favorites.removeWhere((r) => r.id == favoriteRecipe.id);
  return true;
}

Future<User?> backendLogin(String nickname, String password) async {
  await Future.delayed(Duration(seconds: 3));
  for (User usuario in users) {
    if (usuario.login(nickname, password)) {
      return usuario;
    }
  }
  return null;
}

void generateData(BuildContext context) {
  // Aquí va tu lógica para generar datos de ejemplo
}
