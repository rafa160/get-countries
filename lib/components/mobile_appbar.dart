import 'package:aidhere_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileAppbar extends StatelessWidget {

  final VoidCallback onPressed;
  final FaIcon icon;
  final String text;

  const MobileAppbar({Key key, this.onPressed, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      titleSpacing: 0,
      title: const Text('Where in the World?'),
      actions: [
        IconButton(onPressed: onPressed, icon: icon),
        Center(child: Text(text, style: appbar,)),
        const SizedBox(width: 10,),
      ],
    );
  }
}
