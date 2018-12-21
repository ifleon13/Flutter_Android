import 'package:flutter/material.dart';

class VentasPage extends StatefulWidget {
  VentasPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VentasPageState createState() => _VentasPageState();
}



class _VentasPageState extends State<VentasPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}