import 'package:firebase_auth/firebase_auth.dart';
import 'package:luna/features/auth/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  final UserDetails userDetails;

  Authenticated(this.user, this.userDetails);
}

class Unauthenticated extends AuthState {}
