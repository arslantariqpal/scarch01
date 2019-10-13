import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;



void main() => runApp(new TestPage());

class TestPage extends StatelessWidget {
  // This widget is the root of your application.
  static String tag = 'test-page';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'http://scrash.codflux.com/api/user/';

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: { 'Accept':'application/json',
      'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjBkNTE1ODZkY2FkYzNiYjE3ODg1MDZkYzc4OWYxOTUxZTU5OTYzMDBjYzM0OWUxNjk5ZWVkNGY2MmNmMzgzM2U0NjJlN2RlODlkNjNlYmNjIn0.eyJhdWQiOiIxIiwianRpIjoiMGQ1MTU4NmRjYWRjM2JiMTc4ODUwNmRjNzg5ZjE5NTFlNTk5NjMwMGNjMzQ5ZTE2OTllZWQ0ZjYyY2YzODMzZTQ2MmU3ZGU4OWQ2M2ViY2MiLCJpYXQiOjE1NzA5MTc4NDcsIm5iZiI6MTU3MDkxNzg0NywiZXhwIjoxNjAyNTQwMjQ3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.WCreR17irTw5A1LIldUU8Bw1xJcgeXtTCKFRFisRWPHcOuaIK5Vl_BXFK5BSbZWsitYN0NEMQXVW-oBS8b2qtHvIBgncAtKKv-prnEfNr84C9_knEN6oOrk8__C1OM27_zXQ2hjy8H09BuSdKXn9qxAceBDjB7K_Ux0u10yUoqEfOMtVYDLx5jHxIYgSZHV74FbpPDS10cZNRZ-kJqOuwKhRZ3_jUDSe4Tncfh-qTupPuUDd-H4hWmvGKTaMjXo2QoIcIAtXvvH7CSkZbGN-4DMQhrjfk5n6CESbtUi02o0HCgPH678LcOSSUMSEOjutFP9Yrn3zJoVOgzs2Rh8BmV-aJslQSzoviX4CRCmTHBowPi-YFp5zxI8joL5A1Ye2Q-K8VRCZTkWkUUg1uEDolwPmONuDfz4ipN8jAFROMg15kZ2dBaPCBBixHE4uc5OcQ3NOOrPRqDXWM9tkyq77H91yUFxsrLq_lQt9Vp89EQskp3a9rrG9kwQaqCjzIsOK3UxxCu4v090zbn7bRFa_T9B8wvChx2S_tzkFvF5saXOuXx4f6ruQXAMR5vU2TG_8588A4aTx7JL-SPChemtLWIbv9Z40lxQepMZNgEqLgfJgrEJknsTgp_Rvj3yNgr_tiKncnxX4eDp0691EqOVu7E2Dco1OSHgp6hMzcBVbCGo'});

    print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
            child: new RaisedButton(
              child: new Text('Make Request'),
              onPressed: makeRequest,
            )));
  }
}