import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'Beat the Bore',
              )
            ],
            isRepeatingAnimation: true,
          ),
        ));
  }
}
