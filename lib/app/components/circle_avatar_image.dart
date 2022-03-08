import 'package:flutter/material.dart';

class CircleProfileImage extends StatelessWidget {
  const CircleProfileImage(
      {Key? key,
      required this.image,
      required this.radiusValue,
      this.borderColor})
      : super(key: key);
  final String image;
  final Color? borderColor;
  final double radiusValue;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 33,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radiusValue,
        backgroundImage: AssetImage(
          image,
        ),
      ),
    );
  }
}
