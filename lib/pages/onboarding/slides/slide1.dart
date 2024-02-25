import 'package:flutter/material.dart';
import 'package:luna/pages/onboarding/slides/slide_template.dart';

class Slide1 extends StatefulWidget {
  const Slide1({super.key});

  @override
  Slide1State createState() => Slide1State();
}

class Slide1State extends State<Slide1> {
  @override
  Widget build(BuildContext context) => const SlideTemplate(
        title: 'Route estimation',
        image: 'assets/images/onboarding/route_estimate.png',
        description:
            'Take control of your commute with live arrival times and delay of your company shuttle',
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );
}
