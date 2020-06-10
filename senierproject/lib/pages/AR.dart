import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';


class AR_service extends StatefulWidget {
  @override
  _AR_serviceState createState() => _AR_serviceState();
}

class _AR_serviceState extends State<AR_service> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(249, 227, 203, 1)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ARservice'),
        ),
        body: Card(
          margin: const EdgeInsets.all(8),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),    child: Stack(
          children: <Widget>[
          UnityWidget(
          isARScene: true,
        ),
          ]
        )

      ),
    )
    );
  }
}