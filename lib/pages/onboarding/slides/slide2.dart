import 'package:flutter/material.dart';
import 'package:luna/pages/onboarding/slides/slide_template.dart';

class Slide2 extends StatefulWidget {
  const Slide2({super.key});

  @override
  Slide2State createState() => Slide2State();
}

class Slide2State extends State<Slide2> {
  @override
  Widget build(BuildContext context) => const SlideTemplate(
        title: 'Shuttle capacity',
        image: 'assets/images/onboarding/route_estimate.png',
        description:
            'Enjoy a more comfortable ride with capacity information at your finger tips',
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      );
}
