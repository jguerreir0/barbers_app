import 'package:flutter/material.dart';

class BarberCard extends StatelessWidget {
  final String imgUrl;
  final String name;

  const BarberCard({Key? key, required this.imgUrl, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover)),
          ),
          const SizedBox(height: 12),
          Text(name),
        ],
      ),
    );
  }
}
