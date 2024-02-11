import 'package:luna/features/auth/state.dart';
import 'package:luna/features/auth/user_model.dart';
import 'package:luna/features/router/router.dart';

class NavigationController {
  void navigationListener(context, state) {
    if (state is Unauthenticated) {
      router.go("/Welcome");
    }

    if (state is Authenticated) {
      if (state.userDetails.newUser) {
        router.go('/Onboarding');
        return;
      }

      if (state.userDetails.userRole == UserRole.rider.name) {
        router.go('/Rider/');
        return;
      }
    }
  }
}
