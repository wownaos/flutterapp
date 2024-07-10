import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ExtendedImage.asset('assets/images/radish.PNG'),
            SizedBox(height: 10),
            CircularProgressIndicator(color: Colors.red),
            SizedBox(height: 10,),
            AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Loading....',speed: Duration(milliseconds: 80))
                ]
            )
        ],
      ),
    )
    );
  }
}
