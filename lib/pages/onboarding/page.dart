import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:luna/pages/onboarding/slides/slide1.dart';
import 'package:luna/pages/onboarding/slides/slide2.dart';
import 'package:luna/pages/onboarding/slides/slide3.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final int _numPages = 3;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: const [
                Slide1(),
                Slide2(),
                Slide3(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: _numPages,
                  effect: const WormEffect(
                    dotColor: Color.fromRGBO(103, 58, 183, 0.5),
                    activeDotColor: Color.fromRGBO(103, 58, 183, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
