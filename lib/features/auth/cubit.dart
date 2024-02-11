import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luna/features/auth/state.dart';
import 'package:luna/features/auth/user_model.dart';
import 'package:luna/features/auth/utils.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> checkAuthenticationStatus() async {
    print("checking auth status");

    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        UserDetails userDetails = await createOrFetchUserDetails(currentUser);

        emit(Authenticated(currentUser, userDetails));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        if (user != null) {
          final userDetails = await createOrFetchUserDetails(user);

          emit(Authenticated(user, userDetails));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    emit(Unauthenticated());
  }
}
