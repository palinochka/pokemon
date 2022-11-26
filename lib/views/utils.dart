import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getTextWidgets(List<String> strings)
{
  List<Widget> list = <Widget>[];
  for(var i = 0; i < strings.length; i++){
    list.add(Row(children: [Text(strings[i], style: TextStyle(fontSize: 18),)]));
    list.add(Divider(thickness: 1,
      color: Colors.grey[400],));
  }
  return new Column(
      children: list.sublist(0, list.length - 1));
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}