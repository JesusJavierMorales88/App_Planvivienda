import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

import 'package:plan_vivienda_rutas/views/login.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/login': (context) => Login(),
    },
    initialRoute: '/login',
  ));
}
