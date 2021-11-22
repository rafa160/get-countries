import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCachedImage extends StatelessWidget {
  final String image;

  CustomCachedImage({this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
        errorWidget: (context, url, error) => Container(
          height: 80,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/error.png"),
                  fit: BoxFit.fitHeight,
                )
            )
        ),
        imageUrl: image,
        fit: BoxFit.fill);
  }
}
