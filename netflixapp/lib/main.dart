import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // createState 를 통해 myapp에대한 상태를 관리하도록 설정
  _MyAppState createState() => _MyAppState();
}

// myapp의 상태를 관리하는 _myappstate class 생성
class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetflixApp',
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            // 사용자가 직접 손가락 모션을통해서 탭이 전환되지 않도록 반영하는 옵션
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      const SizedBox(height: 300,),
                      Text('홈'),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.search),
                      const SizedBox(height: 300,),
                      Text('검색'),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.download),
                      const SizedBox(height: 300,),
                      Text('저장된 동영상 제목'),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.menu),
                      const SizedBox(height: 300,),
                      Text('더보기'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 60,
            child: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                  child: Text('home'),
                ),
                Tab(
                  icon: Icon(Icons.search),
                  child: Text('search'),
                ),
                Tab(
                  icon: Icon(Icons.save_alt),
                  child: Text('save'),
                ),
                Tab(
                  icon: Icon(Icons.add_circle),
                  child: Text('plus'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
