import 'package:flutter/material.dart';
import 'package:senierproject/pages/login.dart';
import './pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromRGBO(204, 204, 204, 1)
    ),
    home: Login(),
  ));
}
