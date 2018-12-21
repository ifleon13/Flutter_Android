import 'package:flutter/material.dart';


class ProductosPage extends StatefulWidget {
  ProductosPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProductosPageState createState() => _ProductosPageState();
}


class _ProductosPageState extends State<ProductosPage> {

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