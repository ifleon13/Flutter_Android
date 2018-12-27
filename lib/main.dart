import 'package:flutter/material.dart';
import 'package:flutter_android/productos/ProductosPage.dart';
import 'package:flutter_android/ventas/VentasPage.dart';
import 'package:flutter_android/activityresult/SelectionPage.dart';
import 'dart:async' show Future;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder> {
        '/productos': (BuildContext context) => ProductosPage(title: 'Mis Productos'),
        '/ventas': (BuildContext context) => VentasPage(title: 'Mis Ventas'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _selection;

  @override
  Widget build(BuildContext context) {
    Widget buttonWidget = new FlatButton(
      textColor: Colors.blueGrey,
      color: Colors.white,
      child: new Text('To Selection Screen'),
      onPressed: null,
    );


    Widget buttonWidgetRaised = new RaisedButton(onPressed:(){
      irAProductos(context);
    } ,
      child: new Text("Productos"),
    );


    Widget buttonWidgetActivityResult = new RaisedButton(onPressed:(){
      _buttonTapped(context);
    } ,
      child: new Text("Test ActivityResult"),
    );


    List<Widget> widgets = new List<Widget>();
    widgets.add(buttonWidget);
    widgets.add(buttonWidgetRaised);
    widgets.add(buttonWidgetActivityResult);

    if (_selection != null) {
      Widget textWidget = new Text(_selection);
      widgets.add(textWidget);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(

        child: Column(
          children: widgets,
       /*   children: <Widget>[

            new RaisedButton(onPressed:(){
              irAProductos(context);
            } ,
              child: new Text("Productos"),
            ),

            new RaisedButton(onPressed:(){
              irAVentas(context);
            } ,
              child: new Text("Ventas"),
            ),
            new RaisedButton(onPressed:(){

            } ,
              child: new Text("Activity Result"),
            ),
          ], */
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



  void _buttonTapped(BuildContext context) async {
    Map results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionPage()),
    );


    if (results != null && results.containsKey('selection')) {
      setState(() {
        _selection = results['selection'];
      });
    }
  }

}




void irAProductos(BuildContext context){
  print("Button productos"); //1
  Navigator.of(context).pushNamed('/productos'); //2
}


void irAVentas(BuildContext context){
  print("Button ventas"); //1
  Navigator.of(context).pushNamed('/ventas'); //2
}


/*
void _buttonTapped(BuildContext context)  {
  Navigator.of(context).push(new MaterialPageRoute<dynamic>(
    builder: (BuildContext context) {
      return new SelectionPage();
    },
  ));
}*/




