import 'package:go_router/go_router.dart';

import 'package:luna/pages/auth/welcome/page.dart';
import 'package:luna/pages/splash/page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, _) => const SplashPage(),
    ),
    GoRoute(
      path: '/Welcome',
      builder: (context, _) => const WelcomePage(),
    ),
  ],
);
