import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hab_security_fornt/core/utils/token_preference.dart';
import 'package:hab_security_fornt/pages/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TokenPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF172D46),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
