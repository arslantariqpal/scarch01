import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper{

  String serverUrl = "http://scrash.codflux.com/api";
  var status ;
  var statusCode;
  var token ;

  loginData(String email , String password) async{

    String myUrl = "$serverUrl/login1";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "email": "$email",
          "password" : "$password"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  registerData(String name ,String email , String password) async{

    String myUrl = "$serverUrl/register";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name": "$name",
          "email": "$email",
          "password" : "$password"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  Future<List> getData() async{


    final response =
    await http.get('http://scrash.codflux.com/api',
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYwZjMzOTgwOGI3YmVjNTZkYjc2MDRmMjhjYzAyNDE0MjM3NWY0Y2JmZWQwMmFlNjgyNTJlMzFhMGQ3YWJiMzZkZDY2OWE5ZDViZGQ0YjkzIn0.eyJhdWQiOiIyIiwianRpIjoiNjBmMzM5ODA4YjdiZWM1NmRiNzYwNGYyOGNjMDI0MTQyMzc1ZjRjYmZlZDAyYWU2ODI1MmUzMWEwZDdhYmIzNmRkNjY5YTlkNWJkZDRiOTMiLCJpYXQiOjE1NzA2NTAyMjUsIm5iZiI6MTU3MDY1MDIyNSwiZXhwIjoxNjAyMjcyNjI1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.qKo8powch1fq3gWoBGdi0EEhZkYSwd2Waak2IYhCZoaZ0QMF5g7pJ0I_Db5h_3utxeSNLBPd8iiWb_dORdQWoCNAIdT6CNSDeK18cuDqx2XyF4ui5rWqY0xOI2zSyvVy1RzAZinRwAVeBprgsEzqUaBzZdopLbAFCymYoNksSOlApkk6CyplBmHUwJ4NeFkzeaY8V05OGjk7AkIJYG6GUPcgwzzZwGQngCZ87yMWuofGpOjqL-hIFJ9-YzUM6mqdzZLvb2okLCqHtn5YKeDfiuYumTI6xNTb2r_tOVKrv3bQYLNYUE3h626nZN-zCTlI8E_xO5U6GZkqQiDvStzAQWMP0eg5fkbf0_N0rOi39uSSbdNoRjtoU80_Q9RJyD8okogrZxOlukl4Z_FMh3wXXwL-PXLbepODYfPyP4-kTtOczXD7iSCYq5wK_TuZXlqunpDpM_C6aDEHDcDHB_0pYcN5Xs9UX5OkYl0HATTpzAVg4CIyRAdUhGPbW72dYYwwPqAAh4CyfWi-yyTEEHIpkRUOL9wWVzw9ILhnhYahleQYAbYMH7S23MYnL0-s_hGI1LcrlfefxFw1KdYBlVzEcHnXP2SF2c3yCzNPelfMU6fGXT2SOjuTEy8bCrao7cZn9u_58Dps--ZPxFzBnWh93gr7EAokoFxdf9lGYamy3Pw '
        });

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }

//    final prefs = await SharedPreferences.getInstance();
//    final key = 'token';
//    final value = prefs.get(key ) ?? 0;
//
//    String myUrl = "$serverUrl/user/";
//
//    http.Response response = await http.get(myUrl,
//        headers: {
//          'Accept':'application/json',
//          'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYwZjMzOTgwOGI3YmVjNTZkYjc2MDRmMjhjYzAyNDE0MjM3NWY0Y2JmZWQwMmFlNjgyNTJlMzFhMGQ3YWJiMzZkZDY2OWE5ZDViZGQ0YjkzIn0.eyJhdWQiOiIyIiwianRpIjoiNjBmMzM5ODA4YjdiZWM1NmRiNzYwNGYyOGNjMDI0MTQyMzc1ZjRjYmZlZDAyYWU2ODI1MmUzMWEwZDdhYmIzNmRkNjY5YTlkNWJkZDRiOTMiLCJpYXQiOjE1NzA2NTAyMjUsIm5iZiI6MTU3MDY1MDIyNSwiZXhwIjoxNjAyMjcyNjI1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.qKo8powch1fq3gWoBGdi0EEhZkYSwd2Waak2IYhCZoaZ0QMF5g7pJ0I_Db5h_3utxeSNLBPd8iiWb_dORdQWoCNAIdT6CNSDeK18cuDqx2XyF4ui5rWqY0xOI2zSyvVy1RzAZinRwAVeBprgsEzqUaBzZdopLbAFCymYoNksSOlApkk6CyplBmHUwJ4NeFkzeaY8V05OGjk7AkIJYG6GUPcgwzzZwGQngCZ87yMWuofGpOjqL-hIFJ9-YzUM6mqdzZLvb2okLCqHtn5YKeDfiuYumTI6xNTb2r_tOVKrv3bQYLNYUE3h626nZN-zCTlI8E_xO5U6GZkqQiDvStzAQWMP0eg5fkbf0_N0rOi39uSSbdNoRjtoU80_Q9RJyD8okogrZxOlukl4Z_FMh3wXXwL-PXLbepODYfPyP4-kTtOczXD7iSCYq5wK_TuZXlqunpDpM_C6aDEHDcDHB_0pYcN5Xs9UX5OkYl0HATTpzAVg4CIyRAdUhGPbW72dYYwwPqAAh4CyfWi-yyTEEHIpkRUOL9wWVzw9ILhnhYahleQYAbYMH7S23MYnL0-s_hGI1LcrlfefxFw1KdYBlVzEcHnXP2SF2c3yCzNPelfMU6fGXT2SOjuTEy8bCrao7cZn9u_58Dps--ZPxFzBnWh93gr7EAokoFxdf9lGYamy3Pw '
//        });
//    if (myUrl) {
//      // If server returns an OK response, parse the JSON.
//      return json.decode(response.body);
//    } else {
//      // If that response was not OK, throw an error.
//      throw Exception('Failed to load post');
//    }
   // return json.decode(response.body);
  }

  void deleteData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/products/$id";
    http.delete(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        } ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void addData(String name , String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/products";
    http.post(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "name": "$name",
          "price" : "$price"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }


  void editData(int id,String name , String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "http://flutterapitutorial.codeforiraq.org/api/products/$id";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "name": "$name",
          "price" : "$price"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }




  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }






}


