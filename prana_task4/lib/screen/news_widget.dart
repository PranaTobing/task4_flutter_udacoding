import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('news widget', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    );
  }
}