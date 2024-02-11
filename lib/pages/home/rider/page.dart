import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luna/features/auth/cubit.dart';

class RiderPage extends StatelessWidget {
  const RiderPage({super.key});

  @override
  Widget build(BuildContext context) {
    void signOut() {
      context.read<AuthCubit>().signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rider"),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Luna',
            ),
          ],
        ),
      ),
    );
  }
}
