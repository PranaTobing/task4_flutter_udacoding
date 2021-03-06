import 'package:flutter/material.dart';

class GalleryWidget extends StatefulWidget {
  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('gallery widget', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    );
  }
}