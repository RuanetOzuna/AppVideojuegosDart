import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';
import 'package:flutter_modulo1_fake_backend/server_controller.dart';

class RegisterPage extends StatefulWidget {
  final ServerController serverController;
  final BuildContext context;
  final User? userToEdit;

  RegisterPage(this.serverController, this.context, {Key? key, this.userToEdit})
      : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();

  String userName = "";
  String password = "";
  String email = "";
  Genrer genrer = Genrer.MALE;

  String _errorMessage = "";
  File? imageFile;
  bool showPassword = false;
  bool editinguser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffKey,
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            ImagePickerWidget(
              imageFile: this.imageFile,
              onImageSelected: (File file) {
                setState(() {
                  imageFile = file;
                });
              },
            ),
            SizedBox(
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.purple),
              ),
              height: kToolbarHeight + 25,
            ),
            Center(
              child: Transform.translate(
                offset: Offset(0, -40),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 260, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          initialValue: userName,
                          decoration: InputDecoration(labelText: "Usuario:"),
                          onSaved: (value) {
                            userName = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: password,
                          decoration: InputDecoration(
                              labelText: "Contraseña:",
                              suffixIcon: IconButton(
                                icon: Icon(showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                              )),
                          obscureText: !showPassword,
                          onSaved: (value) {
                            password = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: email,
                          decoration: InputDecoration(labelText: "Email:"),
                          onSaved: (value) {
                            email = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Género",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  RadioListTile<Genrer>(
                                    title: Text(
                                      "Masculino",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: Genrer.MALE,
                                    groupValue: genrer,
                                    onChanged: (value) {
                                      setState(
                                            () {
                                          genrer = value!;
                                        },
                                      );
                                    },
                                  ),
                                  RadioListTile<Genrer>(
                                    title: Text(
                                      "Femenino",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: Genrer.FEMALE,
                                    groupValue: genrer,
                                    onChanged: (value) {
                                      setState(
                                            () {
                                          genrer = value!;
                                        },
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              textStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () => _doProcess(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    (editinguser) ? "Actualizar" : "Registrar"),
                                if (_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: CircularProgressIndicator(),
                                  )
                              ],
                            ),
                          ),
                        ),
                        if (_errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              _errorMessage,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _doProcess(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (imageFile == null) {
        showSnackbar(context, "Seleccione una imágen por favor", Colors.red);
        return;
      }
      User user = User(
        id: editinguser ? widget.serverController.loggedUser.id : 0,
        nickname: userName,
        password: password,
        genrer: genrer,
        photo: AssetFile(DefaultAssetBundle.of(context), imageFile!.path),
        email: email,
      );
      bool state;
      if (editinguser) {
        state = await widget.serverController.updateUser(user);
      } else {
        state = await widget.serverController.addUser(user);
      }
      final action = editinguser ? "actualizar" : "guardar";
      final action2 = editinguser ? "actualizado" : "guardado";

      if (state == false) {
        showSnackbar(context, "No se pudo $action", Colors.red);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Información"),
              content: Text("Su usuario ha sido $action2 exitosamente"),
              actions: <Widget>[
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      }
    }
  }

  void showSnackbar(BuildContext context, String title, Color backColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.center,
        ),
        backgroundColor: backColor,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    editinguser = (widget.userToEdit != null);

    if (editinguser) {
      userName = widget.userToEdit!.nickname;
      password = widget.userToEdit!.password;
      imageFile = File(widget.userToEdit!.photo.path);
      genrer = widget.userToEdit!.genrer;
      email = widget.userToEdit!.email;
    }
  }
}
