import 'package:flutter/material.dart';

import 'package:my_aplication/comm/gen_text_form_field.dart';
import 'package:my_aplication/comm/gen_toast_text_field.dart';
import 'package:my_aplication/models/user_model.dart';
import 'package:my_aplication/src/screens/login_page.dart';
import 'package:my_aplication/database_handler/db_helper.dart';
// import 'package:toast/toast.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conUser = TextEditingController();
  final _conName = TextEditingController();
  final _conAName = TextEditingController();
  final _conCurp = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPhone = TextEditingController();
  final _conCorp = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  var dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String uid = _conUserId.text;
    String uuser = _conUser.text;
    String uname = _conName.text;
    String uaname = _conAName.text;
    String curp = _conCurp.text;
    String email = _conEmail.text;
    String phone = _conPhone.text;
    String corp = _conCorp.text;
    String password = _conPassword.text;
    String cpassword = _conCPassword.text;

    if (_formKey.currentState!.validate()) {
      if (password != cpassword) {
        alertDialog(context, 'Las contraseñas no coinciden');
      } else {
        _formKey.currentState!.save();

        UserModel uModel = UserModel(
            uid, uuser, uname, uaname, curp, email, phone, corp, password);
        await dbHelper.saveData(uModel).then((userData) {
          alertDialog(context, "Usuario Creado");

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginPage()));
        }).catchError((error) {
          // ignore: avoid_print
          print(error);
          alertDialog(context, "Error: No se pudo guradar el registro");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Registra un usuario'),
        backgroundColor: Colors.amber[700],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Transform.translate(
            offset: const Offset(0, -250),
            child: Center(
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GetTextFormfield(
                        controller: _conUserId,
                        hintName: 'ID de Usuario',
                        icon: Icons.person,
                        inputType: TextInputType.number,
                      ),
                      GetTextFormfield(
                          controller: _conUser,
                          hintName: 'Nombre de usuario',
                          icon: Icons.person,
                          inputType: TextInputType.name),
                      GetTextFormfield(
                        controller: _conName,
                        hintName: 'Nombre',
                        icon: Icons.person,
                        inputType: TextInputType.name,
                      ),
                      GetTextFormfield(
                        controller: _conAName,
                        hintName: 'Apellido',
                        icon: Icons.person,
                        inputType: TextInputType.name,
                      ),
                      GetTextFormfield(
                        controller: _conCurp,
                        hintName: 'Curp',
                        icon: Icons.announcement_rounded,
                        inputType: TextInputType.text,
                      ),
                      GetTextFormfield(
                        controller: _conEmail,
                        hintName: 'E-mail',
                        icon: Icons.email,
                        inputType: TextInputType.emailAddress,
                      ),
                      GetTextFormfield(
                        controller: _conPhone,
                        hintName: 'Teléfono',
                        icon: Icons.phone,
                        inputType: TextInputType.phone,
                      ),
                      GetTextFormfield(
                        controller: _conCorp,
                        hintName: 'Empresa',
                        icon: Icons.business_center,
                        inputType: TextInputType.name,
                      ),
                      GetTextFormfield(
                        controller: _conPassword,
                        hintName: 'Contraseña',
                        icon: Icons.lock,
                        isObscureText: true,
                      ),
                      GetTextFormfield(
                        controller: _conCPassword,
                        hintName: 'Confirma tu contraseña',
                        icon: Icons.lock,
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
                          signUp();
                        },
                        child: const Text(
                          'Crear Usuario',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('¿Ya estás regitrado?'),
                          TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.amber[700]),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginPage()),
                                    (Route<dynamic> route) => false);
                              },
                              child: const Text('Inicia Sesión')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
