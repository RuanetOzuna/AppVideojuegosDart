import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';
import 'package:flutter_modulo1_fake_backend/avanced/asset_file.dart';

class AddRecipePage extends StatefulWidget {
  final Recipe? recipe;

  AddRecipePage({Key? key, this.recipe}) : super(key: key);

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String name = "", description = "";
  List<String> ingredientsList = [], stepsList = [];
  File? imageFile;
  bool editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: Stack(
          children: <Widget>[
            // ImagePickerWidget needs to be implemented or imported
            // Placeholder widget used for now
            Container(
              color: Colors.grey[200],
              height: 200, // adjust as per your design
              width: double.infinity,
              child: Center(child: Text('Placeholder for ImagePickerWidget')),
            ),
            SizedBox(
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.red),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () {
                      _save(context);
                    },
                  )
                ],
              ),
              height: kToolbarHeight + 25,
            ),
            Center(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 260, bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: ListView(children: <Widget>[
                    TextFormField(
                      initialValue: name,
                      decoration: InputDecoration(labelText: "Nombre de Videojuego"),
                      onSaved: (value) {
                        this.name = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "LLene este campo";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: description,
                      decoration: InputDecoration(labelText: "Descripción"),
                      onSaved: (value) {
                        this.description = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "LLene este campo";
                        }
                        return null;
                      },
                      maxLines: 6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Text("Notas y Valoraciones"),
                      trailing: FloatingActionButton(
                        heroTag: "uno",
                        child: Icon(Icons.add),
                        onPressed: () {
                          _ingredientDialog(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    getIngredientsList(),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Text("Opiniones"),
                      trailing: FloatingActionButton(
                        heroTag: "dos",
                        child: Icon(Icons.add),
                        onPressed: () {
                          _stepDialog(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    getStepsList()
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getStepsList() {
    if (stepsList.isEmpty) {
      return Text(
        "Listado vacío",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey),
      );
    } else {
      return Column(
        children: List.generate(stepsList.length, (index) {
          final ingredient = stepsList[index];
          return ListTile(
            title: Text(ingredient),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _onStepDelete(index);
              },
            ),
          );
        }),
      );
    }
  }

  Widget getIngredientsList() {
    if (ingredientsList.isEmpty) {
      return Text(
        "Listado vacío",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey),
      );
    } else {
      return Column(
        children: List.generate(ingredientsList.length, (index) {
          final ingredient = ingredientsList[index];
          return ListTile(
            title: Text(ingredient),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _onIngredientDelete(index);
              },
            ),
          );
        }),
      );
    }
  }

  void _ingredientDialog(BuildContext context, {String? ingredient, int? index}) {
    // Implement your dialog for editing or adding ingredient here
  }

  void _stepDialog(BuildContext context, {String? step, int? index}) {
    // Implement your dialog for editing or adding step here
  }

  void _showSnackBar(String message, {Color backColor = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backColor,
      ),
    );
  }

  void _onIngredientDelete(int index) {
    setState(() {
      ingredientsList.removeAt(index);
    });
  }

  void _onStepDelete(int index) {
    setState(() {
      stepsList.removeAt(index);
    });
  }

  void _save(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (imageFile == null) {
        _showSnackBar("La imágen está vacía");
        return;
      }
      if (ingredientsList.isEmpty) {
        _showSnackBar("No tiene nota");
        return;
      }
      if (stepsList.isEmpty) {
        _showSnackBar("No tiene opinion");
        return;
      }

      // Implement your recipe saving logic here
    }
  }

  @override
  void initState() {
    super.initState();
    editing = widget.recipe != null;
    if (editing) {
      name = widget.recipe!.name;
      description = widget.recipe!.description;
      ingredientsList = widget.recipe!.ingredients;
      stepsList = widget.recipe!.steps;
      // imageFile = File(widget.recipe!.photo.path); // If you have the photo path, uncomment and use this line
    }
  }
}
