import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Image.network(
          'https://ak.picdn.net/shutterstock/videos/10779833/thumb/1.jpg',
        ),
    );
  }
}