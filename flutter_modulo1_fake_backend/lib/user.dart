import 'dart:io';

enum Genrer { MALE, FEMALE }

class User {
  final int id;
  final String nickname;
  final String password;
  final String email;
  final Genrer genrer;
  final AssetFile photo;

  User({
    required this.id,
    required this.nickname,
    required this.password,
    required this.email,
    required this.genrer,
    required this.photo,
  });

  bool login(String nickname, String password) {
    return this.nickname == nickname && this.password == password;
  }

  User copyWith({
    int? id,
    String? nickname,
    String? password,
    Genrer? genrer,
    File? photo,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
      genrer: genrer ?? this.genrer,
      photo: photo ?? this.photo,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
