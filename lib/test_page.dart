import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final serverUrl = "http://scrash.codflux.com/api";
  final response =
  await http.get('$serverUrl/user/', headers: {
    'Accept':'application/json',
    'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjBkNTE1ODZkY2FkYzNiYjE3ODg1MDZkYzc4OWYxOTUxZTU5OTYzMDBjYzM0OWUxNjk5ZWVkNGY2MmNmMzgzM2U0NjJlN2RlODlkNjNlYmNjIn0.eyJhdWQiOiIxIiwianRpIjoiMGQ1MTU4NmRjYWRjM2JiMTc4ODUwNmRjNzg5ZjE5NTFlNTk5NjMwMGNjMzQ5ZTE2OTllZWQ0ZjYyY2YzODMzZTQ2MmU3ZGU4OWQ2M2ViY2MiLCJpYXQiOjE1NzA5MTc4NDcsIm5iZiI6MTU3MDkxNzg0NywiZXhwIjoxNjAyNTQwMjQ3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.WCreR17irTw5A1LIldUU8Bw1xJcgeXtTCKFRFisRWPHcOuaIK5Vl_BXFK5BSbZWsitYN0NEMQXVW-oBS8b2qtHvIBgncAtKKv-prnEfNr84C9_knEN6oOrk8__C1OM27_zXQ2hjy8H09BuSdKXn9qxAceBDjB7K_Ux0u10yUoqEfOMtVYDLx5jHxIYgSZHV74FbpPDS10cZNRZ-kJqOuwKhRZ3_jUDSe4Tncfh-qTupPuUDd-H4hWmvGKTaMjXo2QoIcIAtXvvH7CSkZbGN-4DMQhrjfk5n6CESbtUi02o0HCgPH678LcOSSUMSEOjutFP9Yrn3zJoVOgzs2Rh8BmV-aJslQSzoviX4CRCmTHBowPi-YFp5zxI8joL5A1Ye2Q-K8VRCZTkWkUUg1uEDolwPmONuDfz4ipN8jAFROMg15kZ2dBaPCBBixHE4uc5OcQ3NOOrPRqDXWM9tkyq77H91yUFxsrLq_lQt9Vp89EQskp3a9rrG9kwQaqCjzIsOK3UxxCu4v090zbn7bRFa_T9B8wvChx2S_tzkFvF5saXOuXx4f6ruQXAMR5vU2TG_8588A4aTx7JL-SPChemtLWIbv9Z40lxQepMZNgEqLgfJgrEJknsTgp_Rvj3yNgr_tiKncnxX4eDp0691EqOVu7E2Dco1OSHgp6hMzcBVbCGo'
  });
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int id;
  final String name;
  final String email;
  final String body;

  Post({this.id, this.name, this.email, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}

void main() => runApp(TestPage(post: fetchPost()));
class TestPage extends StatelessWidget {
  static String tag = 'test-page';
  final Future<Post> post;

  TestPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.email);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}