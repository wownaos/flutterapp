import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'radish app',
      theme: ThemeData(
          primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              '당큰마켓 클론코딩',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
        ),
        body: FutureBuilder(
            future: Future.delayed(Duration(seconds: 10), () => 100),
            builder: (context, snapshot) {
              return AnimatedSwitcher(
              duration: Duration(milliseconds: 900),
                child: _splashLodingWidget(snapshot),
              );
            }
            ),
      ),
    );

  }
  StatelessWidget _splashLodingWidget(AsyncSnapshot<Object> snapshot) {
    if (snapshot.hasError) {print('에러가 발생했습니다.');  return Text('error');}
    else if (snapshot.hasData) {return HomeScreen();}
    else {return SplashScreen();}
  }
}
