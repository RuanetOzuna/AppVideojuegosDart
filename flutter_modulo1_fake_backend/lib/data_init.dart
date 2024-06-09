import 'package:flutter/material.dart';
import 'avanced/asset_file.dart';
import 'recipe.dart';
import 'user.dart';

List<User> users = [];
List<Recipe> recipes = [];
List<Recipe> favorites = [];

void generateData(BuildContext context) {
  final AssetBundle assetBundle = DefaultAssetBundle.of(context);
  users = [
    User(
      id: 1,
      nickname: "Ruanet",
      password: "RuanetCbtis051",
      email: "ruanet@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img1.jpg"),
    ),
    User(
      id: 2,
      nickname: "PipePunk",
      password: "Pipe",
      email: "pipepunk@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img2.jpg"),
    ),
    User(
      id: 3,
      nickname: "TheSlayer360",
      password: "Slayer",
      email: "theslayer360@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img3.jpg"),
    ),
    User(
      id: 4,
      nickname: "Fedelobo",
      password: "Fede",
      email: "fedelobo@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img4.jpg"),
    ),
    User(
      id: 5,
      nickname: "ZicoTops",
      password: "Zico",
      email: "zicotops@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img5.jpg"),
    ),
    User(
      id: 6,
      nickname: "Kormack",
      password: "Fallout",
      email: "kormack@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img6.jpg"),
    ),
    User(
      id: 7,
      nickname: "La Sombra del Imperio",
      password: "RojoCarmesi",
      email: "sombraimperio@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img7.jpg"),
    ),
    User(
      id: 8,
      nickname: "LordTano66",
      password: "Tano66",
      email: "lordtano66@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img8.jpg"),
    ),
    User(
      id: 9,
      nickname: "Apollo1138",
      password: "1138",
      email: "apollo1138@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img9.jpg"),
    ),
    User(
      id: 10,
      nickname: "DarthFeanor",
      password: "Feanor",
      email: "darthfeanor@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img10.jpg"),
    ),
    User(
      id: 11,
      nickname: "JeshuaRevan",
      password: "Revan",
      email: "jeshuarevan@example.com",
      genrer: Genrer.MALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img11.jpg"),
    ),
    User(
      id: 12,
      nickname: "CharlieLynn",
      password: "Lynn",
      email: "charlielynn@example.com",
      genrer: Genrer.FEMALE,
      photo: AssetFile(assetBundle, "assets/images/usuarios/img13.jpg"),
    ),
  ];

  recipes = <Recipe>[
    Recipe(
      id: 1,
      name: "Fallout 4",
      description: "Una aventura sin igual.",
      date: DateTime.now(),
      ingredients: <String>[
        "Valoracion: 10/10",
        "Notas: Es un videojuego excelente para ser del año de 2015.",
      ],
      steps: <String>[
        "Fallout 4 está ambientado en la post-apocalíptica zona estadounidense de la Commonwealth, Massachusetts en el año 2287, 210 años después del inicio de la guerra nuclear que aniquilaria a gran parte de la civilización, en la que el o la protagonista sobrevive en un búnker subterráneo de la compañía Vault-Tec.",
        "En mi opinion: Jueguenlo de verdad no se van a arrepentir",
      ],
      user: users[0],
      photo: AssetFile(assetBundle, "assets/images/videojuegos/fallout4.jpg"),
    ),
    Recipe(
      id: 2,
      name: "Red Dead Redemtion 2",
      description: "La vida de una vaquero que quiere redimirse",
      date: DateTime.now(),
      ingredients: <String>[
        "Valoracion: 10/10",
        "Notas: Una Obra de Arte para los Gamers.",
      ],
      steps: <String>[
        "Estados Unidos, 1899. El ocaso del Salvaje Oeste ha comenzado y las fuerzas de la ley dan caza a las últimas bandas de forajidos. Los que no se rinden o sucumben, son asesinados. Tras un desastroso atraco fallido en la ciudad de Blackwater, Arthur Morgan y la banda de Van der Linde se ven obligados a huir.",
        "Lo que se siente jugando este juego la verdad no tiene nombre, se los recomiendo"
      ],
      user: users[11],
      photo: AssetFile(assetBundle, "assets/images/videojuegos/reddead2.jpg"),
    ),
    Recipe(
      id: 3,
      name: "Minecraft",
      description: "Una aventura donde tu eres tu propio arquitecto.",
      date: DateTime.now(),
      ingredients: <String>[
        "Valoracion: 10/10",
        "Notas: Una aventura muy creativa.",
      ],
      steps: <String>[
        "Minecraft es un juego de mundo abierto, por lo que no posee un objetivo específico, permitiéndole al jugador una gran libertad en cuanto a la elección de su forma de jugar. ... ​​Los jugadores crean granjas que son para conseguir un determinado material más fácil por ejemplo una granja de oro.",
        "Es un juego muy creativo lo recomiendo mucho."
      ],
      user: users[3],
      photo: AssetFile(assetBundle, "assets/images/videojuegos/minecraft.jpg"),
    ),
    Recipe(
      id: 4,
      name: "Fifa 21",
      description: "El mejor juego para los amantes del Futbol.",
      date: DateTime.now(),
      ingredients: <String>[
        "Valoracion: 9/10",
        "Notas: Un juegazo de Futbol.",
      ],
      steps: <String>[
        "FIFA 21 es un videojuego de fútbol del año 2020 disponible para Microsoft Windows, PlayStation 4, Xbox One y Nintendo Switch el 9 de octubre de 2020, y también es el primer videojuego de la serie FIFA para PlayStation 5 y Xbox Series X|S. El juego es la 28.ª entrega de la serie de videojuegos de FIFA.",
        "Es un juego muy bueno para los que le gustan el Futbol, lo recomiendo mucho."
      ],
      user: users[7],
      photo: AssetFile(assetBundle, "assets/images/videojuegos/fifa21.jpg"),
    ),
  ];
}
