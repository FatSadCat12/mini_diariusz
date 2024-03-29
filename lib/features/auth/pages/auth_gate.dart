import 'package:mini_diariusz/features/home/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context, snapshot) {
    // User is not signed in
    if (!snapshot.hasData) {
      return const SignInScreen(
        providerConfigs: [
          EmailProviderConfiguration(),
        ],
      );
    }
        return const HomePage();
     },
    );
  }
}