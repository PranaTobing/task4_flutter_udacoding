import 'package:flutter/material.dart';
import 'package:prana_task4/screen/dictionary_widget.dart';
import 'package:prana_task4/screen/gallery_widget.dart';
import 'package:prana_task4/screen/news_widget.dart';
import 'package:prana_task4/screen/setting_widget.dart';

class HomePage extends StatefulWidget {
  final String userName;
  final String firstName;
  final String lastName;

  HomePage({Key key, @required this.userName, @required this.firstName, @required this.lastName}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  final List<Widget> _listMenu = [
    NewsWidget(),
    GalleryWidget(),
    DictionaryWidget(),
    SettingWidget()
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.userName}'),
      ),
      body: Center(
        child: _listMenu[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Dictionary',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}