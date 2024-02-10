import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:luna/features/auth/cubit.dart';
import 'package:luna/features/auth/state.dart';

class RouterGuard {
  authGuard(BuildContext context) {
    final authState = context.read<AuthCubit>().state;

    print("checkAuthenticationStatus");

    if (authState is AuthInitial) {
      return "/";
    }
    if (authState is Unauthenticated) {
      return "/Welcome";
    }
    if (authState is Authenticated) {
      return "/Home";
    }
  }
}
