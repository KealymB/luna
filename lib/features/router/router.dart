import 'package:go_router/go_router.dart';
import 'package:luna/pages/splash/page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
