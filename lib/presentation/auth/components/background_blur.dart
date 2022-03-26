import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaY: 8.5, sigmaX: 8.5),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/barbershop.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
