import 'package:flutter/material.dart';

import 'login_page.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  static String tag = 'login-page';
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log Me In!',
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}