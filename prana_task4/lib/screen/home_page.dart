import 'package:flutter/material.dart';

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

  static TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widgethome = Text(
      'News',
      style: optionStyle,
    );
    final widgetgallery = Text(
      'Gallery',
      style: optionStyle,
    );
    final widgetdictionary = Text(
      'Dictionary',
      style: optionStyle,
    );
    final widgetsetting = Text(
      'Setting',
      style: optionStyle,
    );

    List<Widget> _widgetOptions = <Widget>[
      widgethome,
      widgetgallery,
      widgetdictionary,
      widgetsetting
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.userName}'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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