

class Movie {

   int userId;
   int id;
   String title;
   String body;

   Movie({this.userId, this.id, this.title, this.body});

   int get getUserId   => userId;
   int get getId       => id;
   String get getTitle => title;
   String get getBody  => body;



   factory Movie.fromJson(Map<String, dynamic> parsedJson){
      return Movie(
          userId:parsedJson['userId'],
          id:parsedJson['id'],
          title:parsedJson['title'],
          body:parsedJson['body']
      );
   }

}