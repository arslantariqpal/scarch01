import 'package:flutter/material.dart';
import 'package:login/signup_page.dart';

import 'login.dart';
import 'home_page.dart';
import 'first_page.dart';
import 'signup_page.dart';
import 'register.dart';
import 'showdata.dart';
import 'dashboard.dart';
import 'test_page.dart';
import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    FirstPage.tag: (context) => FirstPage(),
    SignupPage.tag: (context) => SignupPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    ShowData.tag: (context) => ShowData(),
    Dashboard.tag: (context) => Dashboard(),
    TestPage.tag: (context) => TestPage(),
    App.tag: (context) => App(),
  };

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),

      home: TestPage(),
      routes: routes,
    );
  }
}