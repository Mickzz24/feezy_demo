import 'package:flutter/material.dart';
import 'verify_otp.dart';

class Country {
  final String flag;
  final String code;
  final String dialCode;
  Country(this.flag, this.code, this.dialCode);
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _agreed = false;

  final List<Country> _countries = [
    Country('🇫🇷', 'FR', '+33'),
    Country('🇺🇸', 'US', '+1'),
    Country('🇬🇧', 'GB', '+44'),
    Country('🇩🇪', 'DE', '+49'),
    Country('🇮🇳', 'IN', '+91'),
  ];
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = _countries[0];
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
              
                Padding(
                  padding: const EdgeInsets.only(left: 31),
                  
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: SizedBox(
                    width: 334,
                    height: 41,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome to Feezy',
                        style: const TextStyle(
                          fontFamily: 'Numans',
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,

                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Please enter your mobile number to continue',
                  style: TextStyle(
                    fontFamily: 'Numans',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFF8B8B8B),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE5E5E5)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<Country>(
                          value: _selectedCountry,
                          icon: const Icon(Icons.arrow_drop_down),
                          style: const TextStyle(
                            fontFamily: 'Numans',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          onChanged: (Country? newValue) {
                            setState(() {
                              _selectedCountry = newValue;
                            });
                          },
                          items: _countries.map<DropdownMenuItem<Country>>((Country country) {
                            return DropdownMenuItem<Country>(
                              value: country,
                              child: Row(
                                children: [
                                  Text(country.flag, style: const TextStyle(fontSize: 20)),
                                  const SizedBox(width: 4),
                                  Text(country.dialCode),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE5E5E5)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(
                              fontFamily: 'Numans',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Color(0xFFBDBDBD),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Checkbox(
                      value: _agreed,
                      onChanged: (val) {
                        setState(() {
                          _agreed = val ?? false;
                        });
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    const Flexible(
                      child: Text.rich(
                        TextSpan(
                          text: 'I agree with ',
                          style: TextStyle(
                            fontFamily: 'Numans',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                Center(
                  child: GestureDetector(
                    onTap: _agreed
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyOtpScreen(),
                              ),
                            );
                          }
                        : null,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/Button (6).png',
                          width: 240,
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 