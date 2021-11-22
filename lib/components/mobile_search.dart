import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  final Widget widget;
  final double width;

  const SearchBar({Key key, this.widget, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 20),
      child: Card(
        elevation: 3,
        child: Container(
          width: width,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget,
          ),
        ),
      ),
    );
  }
}
