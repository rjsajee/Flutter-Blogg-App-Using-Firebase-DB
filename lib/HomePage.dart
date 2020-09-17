import 'package:flutter/material.dart';
import 'Authentication.dart';


class HomePage extends StatefulWidget{

  HomePage({
    this.auth,
    this.onSignedOut,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() {
    
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  void _logoutUser() async{
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }

    catch(e){
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),

      body: new Container(
        padding: EdgeInsets.all(40),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

          stops:[
                0.1,
                0.4,
                0.7,
                0.9,
              ] ,

              colors: [
                Colors.pink[100],
                Colors.pink[80],
                Colors.pink[60],
                Colors.pink[40],
              ]
            )
        ),
        ),

        bottomNavigationBar: new BottomAppBar(
        color: Colors.pink,

        child: new Container(

          margin: const EdgeInsets.only(left: 50.0, right: 59.0),

          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.local_car_wash),
                iconSize: 30.0,
                color: Colors.white,

                onPressed: _logoutUser,
              ),

              new IconButton(
                icon: new Icon(Icons.add_a_photo),
                iconSize: 30.0,
                color: Colors.white,

                onPressed: null,
              ),
            ],
          ),
        ),
      ),

      );
      
    
  }
}