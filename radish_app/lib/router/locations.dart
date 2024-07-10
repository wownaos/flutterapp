import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:radish_app/screens/home_screen.dart';

class HomeLocation extends BeamLocation {
  @override
  List<Pattern> get pathPatterns => ['/books/:bookId'];

  @override
  List<BeamPage> buildPages(BuildContext context, RouteInformationSerializable state) {
    return [BeamPage(child: HomeScreen(),key: ValueKey('home'))];
  }

  @override
  List get pathBlueprints => ['/'];
}
