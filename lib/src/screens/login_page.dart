import 'package:flutter/material.dart';

import 'package:my_aplication/comm/gen_text_form_field.dart';
import 'package:my_aplication/comm/gen_toast_text_field.dart';
import 'package:my_aplication/database_handler/db_helper.dart';
// import 'package:my_aplication/models/user_model.dart';
import 'package:my_aplication/src/screens/home_form.dart';
import 'package:my_aplication/src/screens/register_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _conUserId.text;
    String password = _conPassword.text;

    if (uid.isEmpty) {
      alertDialog(context, "Por favor Ingresa un ID de usuario");
    } else if (password.isEmpty) {
      alertDialog(context, "Por favor ingresa tu contraseña");
    } else {
      await dbHelper.getLoginUser(uid, password).then((userData) {
        if (userData != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeForm()),
              (Route<dynamic> route) => false);
        } else {
          alertDialog(context, 'Usuario no encontrado');
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.cyan.shade300,
                  Colors.cyan.shade800,
                ]),
              ),
              height: 280,
              child: Image.asset("assets/image/beach_wave.png"),
            ),
            Transform.translate(
              offset: const Offset(0, -5),
              child: SingleChildScrollView(
                child: Center(
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GetTextFormfield(
                              controller: _conUserId,
                              hintName: 'Usuario',
                              icon: Icons.person),
                          const SizedBox(height: 5.0),
                          GetTextFormfield(
                            controller: _conPassword,
                            hintName: 'Contraseña',
                            icon: Icons.person,
                            isObscureText: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.cyan,
                                padding: const EdgeInsets.all(20)),
                            onPressed: () {
                              login();
                            },
                            child: const Text(
                              'Iniciar Sesión',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('¿No estás regitrado?'),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.amber[700]),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const RegisterForm(),
                                        ));
                                  },
                                  child: const Text('Registrate')),
                            ],
                          )
                        ],
                      ),
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
}
