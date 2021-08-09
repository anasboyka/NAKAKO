import 'package:flutter/material.dart';
import 'package:nakako/tab/carttab.dart';
import 'package:nakako/tab/menutab.dart';
import 'package:nakako/tab/mylisttab.dart';
import 'package:nakako/tab/profiletab.dart';
import 'package:nakako/tab/searchtab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 4;

  final List<Widget> tabs = <Widget>[
    SearchTab(),
    MyListTab(),
    MenuTab(),
    CartTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icon/searchIcUnclick.png', height: 24),
              activeIcon: Image.asset('assets/icon/searchIc.png', height: 24),
              label: 'search'),
          BottomNavigationBarItem(
              icon:
                  Image.asset('assets/icon/bookmarkIcUnclick.png', height: 24),
              activeIcon: Image.asset('assets/icon/bookmarkIc.png', height: 24),
              label: 'wishlist'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icon/menuIcUnclick.png', height: 24),
              activeIcon: Image.asset('assets/icon/menuIc.png', height: 24),
              label: 'menu'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icon/bagIcUnclick.png', height: 24),
              activeIcon: Image.asset('assets/icon/bagIc.png', height: 24),
              label: 'bag'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icon/profileIcUnclick.png', height: 24),
              activeIcon: Image.asset('assets/icon/profileIc.png', height: 24),
              label: 'profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff9D9D9D),
      ),
    );
  }
}
