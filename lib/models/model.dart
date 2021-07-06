// To parse this JSON data, do
//
//     final joke = jokeFromJson(jsonString);

import 'dart:convert';

Joke jokeFromJson(String str) => Joke.fromJson(json.decode(str));

String jokeToJson(Joke data) => json.encode(data.toJson());

class Joke {
  Joke({
    this.error,
    this.amount,
    this.jokes,
  });

  bool error;
  int amount;
  List<JokeElement> jokes;

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        error: json["error"],
        amount: json["amount"],
        jokes: List<JokeElement>.from(
            json["jokes"].map((x) => JokeElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "amount": amount,
        "jokes": List<dynamic>.from(jokes.map((x) => x.toJson())),
      };
}

class JokeElement {
  JokeElement({
    this.category,
    this.type,
    this.joke,
    this.flags,
    this.safe,
    this.id,
    this.lang,
  });

  String category;
  String type;
  String joke;
  Flags flags;
  bool safe;
  int id;
  String lang;

  factory JokeElement.fromJson(Map<String, dynamic> json) => JokeElement(
        category: json["category"],
        type: json["type"],
        joke: json["joke"],
        flags: Flags.fromJson(json["flags"]),
        safe: json["safe"],
        id: json["id"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
        "joke": joke,
        "flags": flags.toJson(),
        "safe": safe,
        "id": id,
        "lang": lang,
      };
}

class Flags {
  Flags({
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
  });

  bool nsfw;
  bool religious;
  bool political;
  bool racist;
  bool sexist;
  bool explicit;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        nsfw: json["nsfw"],
        religious: json["religious"],
        political: json["political"],
        racist: json["racist"],
        sexist: json["sexist"],
        explicit: json["explicit"],
      );

  Map<String, dynamic> toJson() => {
        "nsfw": nsfw,
        "religious": religious,
        "political": political,
        "racist": racist,
        "sexist": sexist,
        "explicit": explicit,
      };
}
