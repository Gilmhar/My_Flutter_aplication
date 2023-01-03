import 'package:flutter/material.dart';
import 'package:my_aplication/comm/gen_text_form_field.dart';
import 'package:my_aplication/src/screens/login_page.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _loading = false;

  final _conUserId = TextEditingController();
  final _conUser = TextEditingController();
  final _conName = TextEditingController();
  final _conAName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPhone = TextEditingController();
  final _conCorp = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Registra un usuario'),
        backgroundColor: Colors.amber[700],
      ),
      body:  SingleChildScrollView(
        child: Transform.translate(
          offset: const Offset(0, -200),
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
                          GetTextFormfield(controller: _conUserId, hintName: 'ID de Usuario', icon: Icons.person, inputType: TextInputType.number,),
                          GetTextFormfield(controller: _conUser, hintName: 'Nombre de usuario', icon: Icons.person, inputType: TextInputType.name),
                          GetTextFormfield(controller: _conName, hintName: 'Nombre', icon: Icons.person, inputType: TextInputType.name,),
                          GetTextFormfield(controller: _conAName, hintName: 'Apellido', icon: Icons.person, inputType: TextInputType.name,),
                          GetTextFormfield(controller: _conUserId, hintName: 'Curp', icon: Icons.announcement_rounded, inputType: TextInputType.streetAddress,),
                          GetTextFormfield(controller: _conEmail, hintName: 'E-mail', icon: Icons.email, inputType: TextInputType.emailAddress,),
                          GetTextFormfield(controller: _conPhone, hintName: 'Teléfono', icon: Icons.phone, inputType: TextInputType.phone,),
                          GetTextFormfield(controller: _conCorp, hintName: 'Empresa', icon: Icons.business_center, inputType: TextInputType.name,),
                          GetTextFormfield(controller: _conPassword, hintName: 'Contraseña', icon: Icons.lock),
                          GetTextFormfield(controller: _conCPassword, hintName: 'Confirma tu contraseña', icon: Icons.lock),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape:  const StadiumBorder(),
                                backgroundColor: Colors.cyan,
                                padding: const EdgeInsets.all(20)),
                            onPressed: () {
                              _login(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Crear Usuario',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                if (_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  )
                              ],
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
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginPage()), (Route<dynamic> route) => false);
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
    );
  }
  void _login(BuildContext context) {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    }
  }
}
