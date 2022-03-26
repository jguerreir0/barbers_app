import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool enableAnimation;
  final double opacityLevel;

  const ActionButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.enableAnimation = false,
      this.opacityLevel = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: TextButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            backgroundColor: Colors.black26),
        onPressed: onTap,
        child: !enableAnimation
            ? Text(
                text,
                style: TextStyle(fontSize: 16),
              )
            : AnimatedOpacity(
                opacity: opacityLevel,
                duration: Duration(seconds: 3),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/loader.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ));
  }
}
