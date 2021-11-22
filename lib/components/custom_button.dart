import 'package:aidhere_app/theme/style.dart';
import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  final Color textColor;
  final Color iconColor;
  final bool isLoading;
  final IconData icon;

  // ignore: prefer_const_constructors_in_immutables
  DefaultButtonWidget({
    this.onPressed,
    this.text,
    this.isLoading = false,
    this.icon,
    this.color,
    this.textColor,
    this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          primary: color
        ),
        onPressed: onPressed,
        child: isLoading
            ? const Center(
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )
            : icon == null
                ? Text(
                    text,
                  )
                : Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(icon, size: 16, color: iconColor,),
                        Container(
                          width: 8,
                        ),
                        Text(
                          text,
                          style: TextStyle(color: textColor),
                        )
                      ],
                    ),
                ),
      ),
    );
  }
}
