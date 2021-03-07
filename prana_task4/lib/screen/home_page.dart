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
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final List<Widget> _listMenu = [
      NewsWidget(),
      GalleryWidget(),
      DictionaryWidget(),
      SettingWidget(userName: widget.userName, firstName: widget.firstName, lastName: widget.lastName)
    ];

    return Scaffold(
      /* appBar: AppBar(
        title: Text('${widget.userName}'),
      ), */
      body: Center(
        child: _listMenu[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[300],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Dictionary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}