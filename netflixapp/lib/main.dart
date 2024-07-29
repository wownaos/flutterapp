import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget{
  // createState 를 통해 myapp에대한 상태를 관리하도록 설정
  _MyAppState createState() => _MyAppState();
}

// myapp의 상태를 관리하는 _myappstate class 생성
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetflixApp',
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
    home: DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          // 사용자가 직접 손가락 모션을통해서 탭이 전환되지 않도록 반영하는 옵션
          physics: NeverScrollableScrollPhysics(),
          children: <Widget> [
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    ),
    );
  }
}