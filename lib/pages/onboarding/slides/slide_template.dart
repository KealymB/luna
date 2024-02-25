import 'package:flutter/material.dart';
import 'package:luna/utils/theme/theme.dart';
import 'package:luna/widgets/styled_image.dart';

class SlideTemplate extends StatelessWidget {
  const SlideTemplate(
      {super.key,
      required this.begin,
      required this.end,
      required this.title,
      required this.image,
      required this.description,
      this.buttonText,
      this.onPressed});

  final Alignment begin;
  final Alignment end;
  final String title;
  final String image;
  final String description;
  final String? buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorTheme.primary(), ColorTheme.secondary()],
          begin: begin,
          end: end,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Stack(children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          StyledImage(
            imagePath: image,
            borderRadius: 10,
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ]),
        if (buttonText != null)
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText!),
            ),
          ),
      ]));
}
