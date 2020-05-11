import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boonus App',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      theme: ThemeData(
      	primaryColor: Colors.white
      ),
    );
  }
}
