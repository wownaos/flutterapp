import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:radish_app/screens/home_screen.dart';
import 'package:radish_app/screens/auth_screen.dart';

class HomeLocation extends BeamLocation {
  @override
  List<Pattern> get pathPatterns => ['/'];

  @override
  List<BeamPage> buildPages(BuildContext context, RouteInformationSerializable state) {
    return [
      BeamPage(
          child: HomeScreen(),
          key: ValueKey('home')
      )
    ];
  }
}