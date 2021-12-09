import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gifts_hub/consts/my_app_icon.dart';
import 'explore_page.dart';
import 'gifts_page.dart';
import 'more_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  int _selectedPageIndex = 0;
  final _pages = [ExplorePage(), GiftsPage(), MorePage()];

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: MyAppIcons.home,
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: MyAppIcons.gifts,
              label: 'Gifts',
            ),
            BottomNavigationBarItem(
              icon: MyAppIcons.more,
              label: 'More',
            ),
          ],
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
