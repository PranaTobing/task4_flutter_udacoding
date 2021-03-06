import 'package:flutter/material.dart';

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('setting widget', style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}