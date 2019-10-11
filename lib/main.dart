import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'first_page.dart';
import 'app.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    FirstPage.tag: (context) => FirstPage(),
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
      home: App(),
      routes: routes,
    );
  }
}