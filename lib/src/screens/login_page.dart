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
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.amber)),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'User name',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.amber)),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Password',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape:  StadiumBorder(),
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
