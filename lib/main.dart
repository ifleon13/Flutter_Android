import 'package:flutter/material.dart';
import 'package:flutter_android/productos/ProductosPage.dart';
import 'package:flutter_android/ventas/VentasPage.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new RaisedButton(onPressed:(){
              irAProductos(context);
            } ,
              child: new Text("Ir a Productos"),
            ),

            new RaisedButton(onPressed:(){
              irAVentas(context);
            } ,
              child: new Text("Ir a Ventas"),
            )
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
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


