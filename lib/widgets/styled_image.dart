import 'package:flutter/material.dart';

class StyledImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const StyledImage({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.asset(
              imagePath,
              fit: fit,
            ),
          ),
        ));
  }
}
