import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final ImageProvider imageProvider;
  final double width;
  final double height;

  CircularImage({
    required this.imageProvider,
    this.width = 350,
    this.height = 350,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 255, 7, 181),
            width: 5,
          ),
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider,
          )),
    );
  }
}
