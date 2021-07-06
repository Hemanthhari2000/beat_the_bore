import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:beat_the_bore/models/model.dart';

class ApiManager {
  static Future<Joke> getJokes(int amountOfJokes) async {
    var client = http.Client();
    var jokeModel;

    try {
      var response = await client.get(Uri.parse(
          "https://v2.jokeapi.dev/joke/Dark?type=single&amount=$amountOfJokes"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        jokeModel = Joke.fromJson(jsonMap);
        print(jokeModel.jokes.length);
      }
    } catch (Exception) {
      return jokeModel;
    }
    return jokeModel;
  }
}
