import 'package:flutter/material.dart';

class DictionaryWidget extends StatefulWidget {
  @override
  _DictionaryWidgetState createState() => _DictionaryWidgetState();
}

class _DictionaryWidgetState extends State<DictionaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Dictionary Widget', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    );
  }
}