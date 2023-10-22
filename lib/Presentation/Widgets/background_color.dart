import 'package:flutter/material.dart';

class BackgroundColor extends StatelessWidget {


  const BackgroundColor({
    required this.height,
    required this.width,
    required this.x,
    required this.y,
    required this.containerColor,
    required this.shape,
    super.key,
  });

  final double height;
  final double width;
  final double x;
  final double y;
  final Color containerColor; 
  final BoxShape shape;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:  AlignmentDirectional(x, y),
      // alignment: const AlignmentDirectional(2.5, -0.3),
      child: Container(
        height: height,
        width: 300,
        decoration:  BoxDecoration(
            shape: shape,
            color: containerColor)
            // color: Color(0xff673ab7)),
      ),
    );
  }
}