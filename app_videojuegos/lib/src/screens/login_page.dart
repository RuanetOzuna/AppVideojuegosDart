import 'package:app_videojuegos/src/connection/server_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';

class LoginPage extends StatefulWidget {
  final ServerController serverController;
  final BuildContext context;

  LoginPage(this.serverController, this.context, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple[300]!,
                    Colors.purple[800]!,
                  ],
                ),
              ),
              child: Image.asset(
                "assets/images/logo.png",
                height: 200,
              ),
            ),
            Transform.translate(
              offset: Offset(0, -90),
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 260, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: "Usuario:"),
                            onSaved: (value) {
                              username = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Este campo es Obligatorio";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 40),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Contraseña:",
                            ),
                            onSaved: (value) {
                              password = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Este campo es Obligatorio";
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          SizedBox(height: 40),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                padding:
                                const EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () => _login(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Iniciar Sesión"),
                                  if (_loading)
                                    Container(
                                      height: 20,
                                      width: 20,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: CircularProgressIndicator(),
                                    ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("¿No estas registrado?"),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Theme.of(context).primaryColor,
                                ),
                                child: Text("Registrarse"),
                                onPressed: () {
                                  _showRegister(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    if (!_loading) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        setState(() {
          _loading = true;
          _errorMessage = "";
        });
        User? user = await widget.serverController.login(username, password);
        if (user != null) {
          Navigator.of(context)
              .pushReplacementNamed("/home", arguments: user);
        } else {
          setState(() {
            _errorMessage = "Usuario o contraseña incorrecto";
            _loading = false;
          });
        }
      }
    }
  }

  void _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/register",
    );
  }

  @override
  void initState() {
    super.initState();
    widget.serverController.init(widget.context);
  }
}
