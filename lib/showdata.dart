import 'package:flutter/material.dart';
import 'controller/databasehelper.dart';
import 'dashboard.dart';
import 'editdata.dart';
import 'register.dart';


class ShowData extends StatefulWidget{
  static String tag = 'showdata-page';
  List list;
  int index;
  ShowData({this.index , this.list}) ;


  @override
  ShowDataState  createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Login'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: ()=>Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Dashboard(),
                  )
              ),
            )
          ],
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[

              Container(
                height: 50,
                child: new Text(
                  "Name : ${ widget.list[widget.index]['name']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  " Price : ${widget.list[widget.index]['email']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new Text(
                  " Created at : ${widget.list[widget.index]['created_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                height: 50,
                child: new Text(
                  " Updated at : ${widget.list[widget.index]['updated_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: new FlatButton(
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new EditData(list:widget.list , index:widget.index),
                          )
                      ) ,
                      color: Colors.green,
                      child: new Text(
                        'Edit',
                        style: new TextStyle(
                          color: Colors.white,
                        ),),
                    ),
                  ),

                  Container(
                    height: 50,
                    child: new FlatButton(
                      onPressed: (){
                        databaseHelper.deleteData(widget.list[widget.index]['id']);
                        Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) => new Dashboard(),
                            )
                        );
                      },
                      color: Colors.blue,
                      child: new Text(
                        'Delete',
                        style: new TextStyle(
                          color: Colors.red,
                        ),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }





}















