import 'package:flutter/material.dart';

class TitleBar {
  PreferredSizeWidget show(String text){
    return AppBar(
      title: Text(text),
      centerTitle: true,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    );
  }
}
