import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_android/models/Movie.dart';

List<Movie> listMovies = new List<Movie>();

 Future<List> loadMovies() async {


  try {

    List movieResponse = [Object];
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);

    movieResponse = json.decode(response.body);

    for (var m in movieResponse) {
      Movie movie = new Movie(userId: m['userId'], id: m['id'], title: m['title'], body: m['body']);
      listMovies.add(movie);
      print(movie.getTitle);
    }

  }catch(e){
    print("ERROR --> "+e.toString());
  }

  return listMovies;
}
