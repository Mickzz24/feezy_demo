import 'package:flutter/material.dart';
import '../screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1100), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF064C3B), // Deep green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/11e3313c77546ac438ce68656152da03be2c9eca (2).png',
              width: 61, height: 92,
            ),
            const SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Numans',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 70,
                  height: 1.0, // 100% line height
                  letterSpacing: 0,
                ),
                children: const [
                  TextSpan(
                    text: 'feezy',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(color: Color(0xFFFFD23F)), // Yellow dot
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
