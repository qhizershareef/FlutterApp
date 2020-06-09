import 'package:flutter/material.dart';
 
 
class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(50, 180, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Address :',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                  ),
              ),
              SizedBox(height: 10),
              Text(
                '8-1-229/B/37 , Madhura Hills,Shaikpet',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25.0
                  ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'Phone :',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                  ),
              ),
              SizedBox(height: 10),
              Text(
                '+91 7794988002',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25.0
                  ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'E-mail :',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                  ),
              ),
              SizedBox(height: 10),
              Text(
                'pharmhouse786@gmail.com',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25.0
                  ),
              )
            ],
          ),
        ),
    );
  }
}