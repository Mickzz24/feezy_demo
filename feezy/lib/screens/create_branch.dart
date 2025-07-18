import 'package:flutter/material.dart';
import 'homescreen.dart';

class OnboardInstitutionScreen extends StatefulWidget {
  const OnboardInstitutionScreen({Key? key}) : super(key: key);

  @override
  State<OnboardInstitutionScreen> createState() => _OnboardInstitutionScreenState();
}

class _OnboardInstitutionScreenState extends State<OnboardInstitutionScreen> {
  final TextEditingController _orgController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _orgController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Onboard your\nInstitution',
                  style: TextStyle(
                    fontFamily: 'Numans',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _orgController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your organisation',
                    hintStyle: TextStyle(
                      fontFamily: 'Numans',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xFFBDBDBD),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFFE5E5E5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFF064C3B)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your location',
                    hintStyle: TextStyle(
                      fontFamily: 'Numans',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xFFBDBDBD),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFFE5E5E5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFF064C3B)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  ),
                ),
                const SizedBox(height: 48),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            organizationName: _orgController.text,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'lib/assets/Button (7).png',
                      width: 78,
                      height: 78,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 