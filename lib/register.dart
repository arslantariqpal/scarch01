import 'package:flutter/material.dart';
import 'package:login/controller/databasehelper.dart';
import 'package:login/login.dart' as prefix0;
import 'Login.dart';
import 'dashboard.dart';

class RegisterPage extends StatefulWidget{
  static String tag = 'register-page';
  RegisterPage({Key key , this.title}) : super(key : key);
  final String title;

  @override
  RegisterPageState  createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();


  _onPressed(){
    setState(() {
      if(
      _nameController.text
          .trim()
          .toLowerCase()
          .isNotEmpty &&
          _emailController.text
              .trim()
              .toLowerCase()
              .isNotEmpty &&
          _mobileController.text
              .trim()
              .toLowerCase()
              .isNotEmpty &&
          _passwordController.text
              .trim()
              .isNotEmpty
      )
      {
        databaseHelper.registerData(
            _nameController.text.trim(),
            _emailController.text.trim().toLowerCase(),
            _mobileController.text.trim(),
            _passwordController.text.trim()
        ).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password';
          }else{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          }
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Register'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Place your name',
                    icon: new Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Place your email',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _mobileController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Place your Phone Number',
                    icon: new Icon(Icons.phone),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: new TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Place your password',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _onPressed,
                  color: Colors.blue,
                  child: new Text(
                    'Register',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.blue),),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new Text(
                  '$msgStatus',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,

                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => prefix0.LoginPage()),
                    );
                  },
                  padding: EdgeInsets.all(12),
                  color: const Color(0xFFF2216C),
                  child: Text('Log In', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(

                child: new Text(
                  'Close',
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );
  }



}















