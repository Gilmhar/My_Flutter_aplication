import 'package:flutter/material.dart';

import 'package:my_aplication/src/screens/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyanAccent, 
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)
      ),
      onGenerateRoute: (RouteSettings settings) {
       return MaterialPageRoute(builder: (BuildContext context)=>const LoginPage());
      } ,
    );
  }
}