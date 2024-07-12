import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radish_app/screens/splash_screen.dart';
import 'package:radish_app/screens/auth_screen.dart';
import 'package:radish_app/router/locations.dart';

// beamer(^0.14.1) > beamer(^1.0.0) 이후
// pathBlueprints > pathPatterns으로 변경
// BeamPage의 state 부분도 RouteInformationSerializable state 로 변경

final _routerDelegate = BeamerDelegate(
    guards: [
      BeamGuard(
        // pathatterns 부분이 이해가 잘안됨
        // ['/'] -> 모든 경로를 일치시키고 로그인 페이지를 표시할시
        // "Invalid argument: Maximum call stack size exceeded"  에러 발생
        // 재귀호출로 인한 문제
          pathPatterns: ['/'],
          check: (context, location) {
            final autoProvider = context.watch<AuthProvider>();
            return autoProvider.isLoggedin;
          },
          showPage: BeamPage(
              child: AutoScreen()
          )
      )
    ],
    locationBuilder: BeamerLocationBuilder(
      // beamLocations 는 Beamer에게 어떤 화면을 맡길지 알려주는 파라미터입니다.
        beamLocations: [HomeLocation()]
    )
);

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
            future: Future.delayed(Duration(seconds: 3), () => 100),
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
    else if (snapshot.hasData) {return RadishApp();}
    else {return SplashScreen();}
  }
}

//autoprovider
class AuthProvider extends ChangeNotifier {
  bool _isLoggedin = false;

  bool get isLoggedin => _isLoggedin;

  void login() {
    if (!_isLoggedin) {
      _isLoggedin = true;
      notifyListeners();
    }
  }

  void logout() {
    if (!_isLoggedin) {
      _isLoggedin = false;
      notifyListeners();
    }
  }
}

class RadishApp extends StatelessWidget {
  const RadishApp({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // beamer에게 모든 페이지 이동권한을 줌
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          // 하위 서브 클래스들이 init을 할 수 있도록 해주는 역할
          routeInformationParser: BeamerParser(),
          // routerDelegate : 'beamer instance name' parser가 해석한 정보를 전달받을 객체
          routerDelegate: _routerDelegate,
        )
    );
  }
}
