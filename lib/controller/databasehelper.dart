import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class DatabaseHelper{
  final serverUrl = "http://scrash.codflux.com/api";
  var status ;
  var statusCode;
  var token ;

  loginData(String email , String password) async{
    final myUrl = "$serverUrl/login";
    final response = await  http.post(myUrl
        ,body: {
          "email": "$email",
          "password" : "$password"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);
//log(myUrl);
    if(status){
     _showDialog();
      log('data : ${data["error"]}');
    }else{
      var token = data['success']['token'];
      print('data : $token');
      log(token);
      _save(token);
    }

  }

  registerData(String name ,String email ,String mobile , String password) async{
    String myUrl = "$serverUrl/register";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json',
        },
        body: {
          "usertype": "scrape yard",
          "name": "$name",
          "email": "$email",
          "mobile": "$mobile",
          "password" : "$password",
          "c_password":"$password"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);
    if(status){
      print('data : ${data["error"]}');
    }else{
      var token = data['success']['token'];
      print('data : $token');
      _save(token);
    }

  }

  Future<List> getData() async{

     var token = read();
     log('token : $token');
    final response =
    await http.get('$serverUrl/user/', headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImEwODU1ZTQ4MThiZjMwYzc0ZjdlM2QxYmVkYjk0OTA4ODlhMjJhNTljY2QyNzcyY2E4ODYyMDg1YjYzNzcyZDhjNDFhN2FlOGExMDdmNWU3In0.eyJhdWQiOiIxIiwianRpIjoiYTA4NTVlNDgxOGJmMzBjNzRmN2UzZDFiZWRiOTQ5MDg4OWEyMmE1OWNjZDI3NzJjYTg4NjIwODViNjM3NzJkOGM0MWE3YWU4YTEwN2Y1ZTciLCJpYXQiOjE1NzEwNzIwMTAsIm5iZiI6MTU3MTA3MjAxMCwiZXhwIjoxNjAyNjk0NDEwLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.UdENSL7r4a05yFhy71OJaOKjZz93VNI8dN3qT228yAVu4Dkj8DH27uXoqQvz_oGhP93R6Iz4CCtjvYeZKYT_yqy-k62PYkD2v3z5K-bbVsZfhB1ww00phY6p0T9d-8nMYre78AQ22wroLLj9yOHe4Cu6KCrHkv5BVPT0snzW2cSGrhmZkiXM7D2ZkG_ApzQDH3dJyqirsXdHZLVDRLzbuSeYHDsTzVMhoGhF1opZHHzryKvW_GjnMUNFLKPGmuy4aHz3Q5PwaJ3eFXiGjOg8kVBzYIxLo3m-ZR3WEbQ0APqYb3L4qzoW1vvgn9pb-12bQi0Fsjae9ZBOd1BJ85mvW9PUTs6SZY2lkPYf6Fbu9DbE8rcHCkuaPgkN4KnEa32_dF82nNZzprCQJfGyc6i-rGISKbhQlTJEwcnN2mjskQGIhdwDxUb2v5nErCnQiAsL7ebfN0iSMc4OfjSZZ5C1p3u5JAH95DYRR2NhW1JdjZkzq_OieK25aYXYZtSoQG8gLbGXz44sdfNKRF7O1gucNqibHmrbwvRICKu_uxb5qrt3AxuYcSELHZafCQnbkvlaZP39cqqOMLNrLkFE9fMCFHFY0F0IdCYygumHl5Nh9zcSG3dOm2kT',
        });

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

//    final prefs = await SharedPreferences.getInstance();
//    final key = 'token';
//    final value = prefs.get(key ) ?? 0;
//
//    final myUrl = "$serverUrl/user/";
//
//     http.Response response = await http.get(myUrl,
//        headers: {
//          'Accept':'application/json',
//          'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjBkNTE1ODZkY2FkYzNiYjE3ODg1MDZkYzc4OWYxOTUxZTU5OTYzMDBjYzM0OWUxNjk5ZWVkNGY2MmNmMzgzM2U0NjJlN2RlODlkNjNlYmNjIn0.eyJhdWQiOiIxIiwianRpIjoiMGQ1MTU4NmRjYWRjM2JiMTc4ODUwNmRjNzg5ZjE5NTFlNTk5NjMwMGNjMzQ5ZTE2OTllZWQ0ZjYyY2YzODMzZTQ2MmU3ZGU4OWQ2M2ViY2MiLCJpYXQiOjE1NzA5MTc4NDcsIm5iZiI6MTU3MDkxNzg0NywiZXhwIjoxNjAyNTQwMjQ3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.WCreR17irTw5A1LIldUU8Bw1xJcgeXtTCKFRFisRWPHcOuaIK5Vl_BXFK5BSbZWsitYN0NEMQXVW-oBS8b2qtHvIBgncAtKKv-prnEfNr84C9_knEN6oOrk8__C1OM27_zXQ2hjy8H09BuSdKXn9qxAceBDjB7K_Ux0u10yUoqEfOMtVYDLx5jHxIYgSZHV74FbpPDS10cZNRZ-kJqOuwKhRZ3_jUDSe4Tncfh-qTupPuUDd-H4hWmvGKTaMjXo2QoIcIAtXvvH7CSkZbGN-4DMQhrjfk5n6CESbtUi02o0HCgPH678LcOSSUMSEOjutFP9Yrn3zJoVOgzs2Rh8BmV-aJslQSzoviX4CRCmTHBowPi-YFp5zxI8joL5A1Ye2Q-K8VRCZTkWkUUg1uEDolwPmONuDfz4ipN8jAFROMg15kZ2dBaPCBBixHE4uc5OcQ3NOOrPRqDXWM9tkyq77H91yUFxsrLq_lQt9Vp89EQskp3a9rrG9kwQaqCjzIsOK3UxxCu4v090zbn7bRFa_T9B8wvChx2S_tzkFvF5saXOuXx4f6ruQXAMR5vU2TG_8588A4aTx7JL-SPChemtLWIbv9Z40lxQepMZNgEqLgfJgrEJknsTgp_Rvj3yNgr_tiKncnxX4eDp0691EqOVu7E2Dco1OSHgp6hMzcBVbCGo'
//        });
//    return json.decode(response.body);
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

  void _showDialog() {
    // flutter defined function
    var context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




}


