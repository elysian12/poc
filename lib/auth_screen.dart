import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
// import 'package:google_sign_in_web/google_sign_in_web.dart' as web;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  GoogleSignInAccount? user;

  GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: '985728519118-erpu13fb9eg3j7oma56vavgojpolu17a.apps.googleusercontent.com',
  );

  @override
  void initState() {
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
      user = account;
      final auth = await user!.authentication;
      print('auth: ${auth.idToken}');
      print('auth: ${auth.accessToken}');
      // print('user: $user');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          // child: (GoogleSignInPlatform.instance as web.GoogleSignInPlugin).renderButton(),
          ),
    );
  }
}
