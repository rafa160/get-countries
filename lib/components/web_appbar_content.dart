import 'package:aidhere_app/components/mobile_search.dart';
import 'package:flutter/material.dart';

class WebAppBarContent extends StatelessWidget {

  final Widget searchWidget;
  final Widget expandedTile;

  const WebAppBarContent({Key key, this.searchWidget, this.expandedTile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: SearchBar(
            width: 600,
            widget: searchWidget
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: expandedTile,
          ),
        )
      ],
    );
  }
}
