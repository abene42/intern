import 'package:flutter/material.dart';

class ProfilePhotoAvatar extends StatelessWidget {
  final String imageUrl;
  List<Color> colors;
  final double? radius;

  ProfilePhotoAvatar({
    Key? key,
    required this.imageUrl,
    required this.colors,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: const Alignment(0, 1),
          end: const Alignment(2, -1),
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
        radius: radius ?? 22,
      ),
    );
  }
}
