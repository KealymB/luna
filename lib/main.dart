import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:luna/features/auth/cubit.dart';
import 'package:luna/features/auth/state.dart';
import 'package:luna/features/router/router.dart';
import 'package:luna/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Luna());
}

class Luna extends StatelessWidget {
  const Luna({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp.router(
          title: 'Luna',
          theme: ThemeData(
            colorScheme: const ColorScheme.dark(),
            useMaterial3: true,
          ),
          routerConfig: router,
          builder: (context, child) => BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is Unauthenticated) {
                    router.go("/Welcome");
                  }

                  if (state is Authenticated) {
                    router.go("/Home");
                  }
                },
                child: child,
              )),
    );
  }
}
