import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hab_security_fornt/core/utils/token_preference.dart';
import 'package:hab_security_fornt/pages/auth/login.dart';
import 'package:hab_security_fornt/pages/layout/layout.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? bearerToken;

  @override
  void initState() {
    log("bearerToken=====>$bearerToken");
    super.initState();
    bearerToken = TokenPreference.getToken();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        if (bearerToken != null && bearerToken!.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Layout(),
            ),
          );
          Get.off(() => Layout());
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash.png",
              width: size.width * 0.5,
              height: size.height * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
