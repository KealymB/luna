import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:luna/features/auth/user_model.dart';

Future<UserDetails> createOrFetchUserDetails(User user) async {
  final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
  final userDoc = await userRef.get();

  if (!userDoc.exists) {
    final UserDetails userDetails = NewUserDetails();
    await userRef.set(userDetails.toMap());

    return userDetails;
  }

  return UserDetails.fromSnapshot(userDoc.data()!);
}
