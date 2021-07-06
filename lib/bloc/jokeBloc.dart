import 'dart:async';

import 'package:beat_the_bore/models/model.dart';
import 'package:beat_the_bore/services/api_manager.dart';

enum JokeAction { Fetch }

class JokeBloc {
  final _stateStreamController = StreamController<List<JokeElement>>();
  StreamSink<List<JokeElement>> get _jokeSink => _stateStreamController.sink;
  Stream<List<JokeElement>> get jokeStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<JokeAction>();
  StreamSink<JokeAction> get eventSink => _eventStreamController.sink;
  Stream<JokeAction> get _eventStream => _eventStreamController.stream;

  final int amountOfJokes = 20;

  JokeBloc() {
    _eventStream.listen((event) async {
      if (event == JokeAction.Fetch) {
        try {
          var jokes = await ApiManager.getJokes(amountOfJokes);
          _jokeSink.add(jokes.jokes);
          // ignore: unused_catch_clause
        } on Exception catch (e) {
          _jokeSink.addError('Something went wrong in Api Call!');
        }
      }
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
