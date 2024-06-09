import 'avanced/asset_file.dart';
import 'user.dart';

class Recipe {
  final int id;
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final AssetFile photo;
  final DateTime date;
  final User user;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.photo,
    required this.date,
    required this.user,
  });

  Recipe copyWith({
    int? id,
    String? name,
    String? description,
    List<String>? ingredients,
    List<String>? steps,
    AssetFile? photo,
    DateTime? date,
    User? user,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      photo: photo ?? this.photo,
      date: date ?? this.date,
      user: user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Recipe && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
