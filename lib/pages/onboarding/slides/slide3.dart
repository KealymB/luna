import 'package:flutter/material.dart';
import 'package:luna/pages/onboarding/slides/slide_template.dart';

class Slide3 extends StatefulWidget {
  const Slide3({super.key});

  @override
  Slide3State createState() => Slide3State();
}

class Slide3State extends State<Slide3> {
  @override
  Widget build(BuildContext context) => SlideTemplate(
        title: 'Route estimation',
        image: 'assets/images/onboarding/route_estimate.png',
        description:
            'Take control of your commute with accurate arrival times of your company shuttle',
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        buttonText: "Get started",
        onPressed: () => print('Get started'),
      );
}
