import 'package:flutter/material.dart';
import 'splash/splash_screen.dart';
import 'colors/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feezy',
      theme: ThemeData(
        primaryColor: AppColors.racingGreen,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.racingGreen,
          primary: AppColors.racingGreen,
        ),
        fontFamily: 'Numans',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
