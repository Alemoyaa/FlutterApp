
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AvatarPage'),
        actions: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 5.0),
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://st2.depositphotos.com/9223672/12056/v/950/depositphotos_120568216-stock-illustration-male-face-avatar-logo-template.jpg'),
              radius: 25.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0,top: 5.0),
            child: CircleAvatar(
              child: Text('AM'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://st2.depositphotos.com/9223672/12056/v/950/depositphotos_120568216-stock-illustration-male-face-avatar-logo-template.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeOutDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
