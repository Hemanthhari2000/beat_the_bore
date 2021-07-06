import 'package:animated_background/animated_background.dart';
import 'package:beat_the_bore/bloc/jokeBloc.dart';
import 'package:beat_the_bore/components/customAppBar.dart';
import 'package:beat_the_bore/components/jokeSwiper.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> with TickerProviderStateMixin {
  final jokeBloc = JokeBloc();
  @override
  void initState() {
    jokeBloc.eventSink.add(JokeAction.Fetch);
    super.initState();
  }

  @override
  void dispose() {
    jokeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: AnimatedBackground(
            vsync: this,
            behaviour: RandomParticleBehaviour(
              options: kParticleOptions,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomAppBar(),
                ),
                Expanded(
                  flex: 8,
                  child: JokeSwiper(
                    jokeBloc: jokeBloc,
                    size: size,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
