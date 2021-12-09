import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItemsListingPage extends StatefulWidget {


  final String category;

  const CategoryItemsListingPage({required this.category});


  @override
  _CategoryItemsListingPageState createState() => _CategoryItemsListingPageState();
}

class _CategoryItemsListingPageState extends State<CategoryItemsListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 57.6,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                   // padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                  Text(
                    widget.category
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
          ],
        ),
      ),
    );
  }
}
