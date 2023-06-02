import 'package:flutter/material.dart';

class SplashLoginWelcomePagesImages extends StatelessWidget {
  const SplashLoginWelcomePagesImages({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}
