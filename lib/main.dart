import 'package:flutter/material.dart';
import 'package:flutter_android/models/Movie.dart';
import 'package:flutter_android/services/MovieService.dart';



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
      home:  ContactsPage(),
    );
  }
}


class ContactsPage extends StatefulWidget  {

  ContactsPage({Key key}) : super(key: key);

  @override
  _MyHomePageContactsState createState() => _MyHomePageContactsState();

}


class _MyHomePageContactsState extends State<ContactsPage> {

  List<Movie> listMovies;

  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Contacts"),
        ),
        body: _listado()
    );
  }



  Widget _listado(){

    return FutureBuilder(

        future: this._fetchData(),
        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.done){

            return ListView.builder(
                itemCount: listMovies.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(position);
                });
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }





    Widget getRow(int index) {

      return ListTile(
          leading: CircleAvatar(
              child: Text("${listMovies[index].getTitle[0].toUpperCase()}")
          ),
          title: Text("${listMovies[index].getTitle}"),
          subtitle: Text("${listMovies[index].getTitle}"),
          onTap: () => _onTapItem(context, listMovies[index]),
      );
    }


  void _onTapItem(BuildContext context, Movie movie) {
    _showDialog(movie.getTitle, movie.getBody);
  }


    _fetchData() async {
    await loadMovies().then((dynamic res) {
        listMovies = res;
      });
    }



  void _showDialog(String title, String msn) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(msn),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Aceptar"),
              textColor: Colors.pink,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
