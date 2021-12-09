import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestingTwo extends StatefulWidget {
  String imageUrl;
  TestingTwo({required this.imageUrl});

  @override
  _TestingTwoState createState() => _TestingTwoState();
}

class _TestingTwoState extends State<TestingTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 57.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    // padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                  Text('hello'
                  ),
                  IconButton(
                    // padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => print('Add to Favorites'),
                    icon: Icon(Icons.favorite_border),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),

                ],
              ),

            ),
            Container(
                height: 60,
                width: 60, child: Image(image: NetworkImage(widget.imageUrl))),
          ],
        ),
      ),
    );
  }
}
