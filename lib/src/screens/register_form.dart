import 'package:flutter/material.dart';
import 'package:my_aplication/src/screens/login_page.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -400),
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
                              labelText: "Usuario:",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan))),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Contraseña:",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan))),
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
                                'Registrar',
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
                            const Text('¿Ya tienes una cuenta?'),
                            TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.amber[700]),
                                onPressed: () {
                                  Navigator.push(context, 
                                      MaterialPageRoute(builder: (_) => const LoginPage(),));
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
