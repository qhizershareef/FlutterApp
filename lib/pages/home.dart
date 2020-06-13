import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';



class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  Padding(
         padding: EdgeInsets.all(0),
         child: ListView(
           children: <Widget>[
             SizedBox(
           height: 300,
           width: double.infinity,
           child: Carousel(
    images: [
      NetworkImage('https://pharmhouse.in/img/slider/12.jpg'),
      NetworkImage('https://images.unsplash.com/photo-1585435557343-3b092031a831?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
      NetworkImage('https://images.unsplash.com/photo-1587854680352-936b22b91030?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
    ],
     dotSize: 4.0,
    dotSpacing: 15.0,
    dotColor: Colors.black,
    indicatorBgPadding: 5.0,
    dotBgColor: Colors.red[800],
    borderRadius: false,
  ),
         ),
         SizedBox(height: 30),
         Center(
           child: Text("OUR SERVICES",
           style: TextStyle(
                letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              )
           ),
         ),
         SizedBox(height: 20),
         Card(
           child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                   leading: Icon(Icons.arrow_forward_ios),
              title: Text('Get your medicines',
              ),
                )
              ],
           ),
         ),
         SizedBox(height: 20),
         Card(
           child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                   leading: Icon(Icons.arrow_forward_ios),
              title: Text('Get your medicines',
              ),
                )
              ],
           ),
         ),
         SizedBox(height: 20),
         Card(
           child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                   leading: Icon(Icons.arrow_forward_ios),
              title: Text('Get your medicines',
              ),
                )
              ],
           ),
         )
           ],
         ),
       )
    );
  }
}