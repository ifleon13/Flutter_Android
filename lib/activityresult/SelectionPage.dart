import 'package:flutter/material.dart';

const String ITEM_1 = 'Item 1';
const String ITEM_2 = 'Item 2';

class SelectionPage extends StatelessWidget {
  SelectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttons = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new FlatButton(
            textColor: Colors.blueGrey,
            color: Colors.white,
            child: new Text(ITEM_1),
            onPressed: () => _selectItem(ITEM_1, context),
          ),
          new FlatButton(
            textColor: Colors.blueGrey,
            color: Colors.white,
            child: new Text(ITEM_2),
            onPressed: () => _selectItem(ITEM_2, context),
          ),
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Selection page"),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        child: buttons,
      ),
    );
  }

  void _selectItem(String value, BuildContext context) {
    Navigator.of(context).pop({'selection':value});
  }
}