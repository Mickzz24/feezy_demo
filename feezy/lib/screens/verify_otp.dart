import 'package:flutter/material.dart';
import 'create_branch.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phoneNumber;
  const VerifyOtpScreen({Key? key, this.phoneNumber = '[phone number]'}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    for (var c in _otpControllers) {
      c.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 60,
      height: 55,
      child: TextField(
        controller: _otpControllers[index],
        focusNode: index == 0 ? _focusNode : null,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontFamily: 'Numans',
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFF064C3B), width: 1),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
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
                const SizedBox(height: 40),
                
                const Text(
                  'Verify Your OTP',
                  style: TextStyle(
                    fontFamily: 'Numans',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                // Subtitle
                Text(
                  'Enter the OTP sent to ${widget.phoneNumber}',
                  style: const TextStyle(
                    fontFamily: 'Numans',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFF8B8B8B),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 40),
                // OTP boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (i) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _buildOtpBox(i),
                  )),
                ),
                const SizedBox(height: 24),
                // Resend code
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't get the code? ",
                      style: TextStyle(
                        fontFamily: 'Numans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Resend Code',
                        style: TextStyle(
                          fontFamily: 'Numans',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFF064C3B),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                // Navigation button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardInstitutionScreen(),
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