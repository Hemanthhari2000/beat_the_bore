import 'package:beat_the_bore/bloc/jokeBloc.dart';
import 'package:beat_the_bore/constants/constants.dart';
import 'package:beat_the_bore/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class JokeSwiper extends StatelessWidget {
  const JokeSwiper({
    Key key,
    @required this.jokeBloc,
    @required this.size,
  }) : super(key: key);

  final JokeBloc jokeBloc;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<JokeElement>>(
        stream: jokeBloc.jokeStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Swiper(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var joke = snapshot.data[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: kGradientColors[index],
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0 * 2,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        joke.joke,
                        style: GoogleFonts.indieFlower(
                          textStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemWidth: size.width * .8,
              itemHeight: size.height * .7,
              layout: SwiperLayout.STACK,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return Center(
            child: SpinKitRipple(
              color: Colors.red,
              size: 100,
            ),
          );
        },
      ),
    );
  }
}
