import 'package:flutter/material.dart';

import 'package:my_aplication/src/screens/register_form.dart';
import 'package:my_aplication/src/screens/custom_sufix_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            height: 330,
            child: Image.asset("assets/image/beach_wave.png"),
          ),
          Transform.translate(
            offset: const Offset(0, -135),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Correo electrónico:",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan)),
                                  hintText: 'Tu correo@cuenta.com',
                                  suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                                  ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Contraseña:",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan)),
                                  hintText: 'Tu contraseña',
                                  suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                  ),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan,
                              padding: const EdgeInsets.all(20)),
                          onPressed: () {
                            _login(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Iniciar Sesión',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
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
                                  Navigator.push(context, 
                                      MaterialPageRoute(builder: (_) => const RegisterForm(),));
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
