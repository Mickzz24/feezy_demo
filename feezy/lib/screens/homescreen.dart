import 'package:flutter/material.dart';
import 'creategroups.dart';
import 'groupscreen.dart';
import 'payments_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final String? organizationName;
  
  const HomeScreen({Key? key, this.organizationName}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final themeGreen = Color(0xFF024C3C);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Home tab
        selectedItemColor: themeGreen,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => GroupScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PaymentsScreen()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
          // Do nothing for index == 0 (Home)
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Stack(
                clipBehavior: Clip.none,
                children: [
                  
                  Container(
                    width: 390,
                    height: 292,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xFF024C3C),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('No Branch Details', style: TextStyle(color: Colors.white, fontSize: 18)),
                            const Icon(Icons.arrow_drop_down, color: Colors.white),
                            const Spacer(),
                            Stack(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.notifications, color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const NotificationScreen()),
                                    );
                                  },
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Colors.red,
                                    child: const Text('2', style: TextStyle(fontSize: 9, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 90),
                        const Text('Welcome 👋', style: TextStyle(color: Colors.white, fontSize: 18)),
                        Text(
                          organizationName ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Stat card - positioned to overlap the header
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: -40, // Negative value to overlap
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _statColumn('Collected Amount', '₹ 0'),
                          _divider(),
                          _statColumn('Due Amount', '₹ 0'),
                          _divider(),
                          _statColumn('Total Groups', '0'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60), // Add space for the overlap
              // Groups Card
              _infoCard(
                title: 'Groups',
                subtitle: 'Create a group to manage your students and track their payments effortlessly.',
                imageAsset: 'lib/assets/c0aee5fba5c9d90ce3916519d2d4ebe21b46bfa0.png',
                buttonLabel: 'Create',
                color: themeGreen,
                buttonColor: themeGreen,
                useImageButton: true,
                imageWidth: 142,
                imageHeight: 142,
              ),
              // Quick Payments Card
              _infoCard(
                title: 'Quick Payments',
                subtitle: 'Create a group to manage your students and track their payments effortlessly.',
                imageAsset: 'lib/assets/c52c6f39a3086da9da88a5540928fb2fdd16a572.png', // Use your people with coins image asset
                buttonLabel: 'Create',
                color: themeGreen,
                buttonColor: themeGreen,
                imageOnLeft: true,
                useImageButton: true,
              ),
              // Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'lib/assets/Banner.png',
                      width: 347,
                      height: 310,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statColumn(String label, String value) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _divider() => Container(
        height: 30,
        width: 1,
        color: Colors.grey[300],
      );

  Widget _infoCard({
    required String title,
    required String subtitle,
    required String imageAsset,
    required String buttonLabel,
    required Color color,
    required Color buttonColor,
    bool imageOnLeft = false,
    bool useImageButton = false,
    double? imageWidth,
    double? imageHeight,
  }) {
    Widget _buildButton() {
      if (useImageButton) {
        return GestureDetector(
          onTap: () {},
          child: Image.asset(
            'lib/assets/Button (6).png',
            width: 88,
            height: 36,
          ),
        );
      } else {
        return SizedBox(
          height: 36,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              minimumSize: Size(88, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
            child: Text(buttonLabel),
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: imageOnLeft ? [
            Expanded(
              child: Image.asset(
                imageAsset, 
                width: imageWidth ?? 142,
                height: imageHeight ?? 142, 
                fit: BoxFit.contain
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 6),
                  Text(subtitle, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildButton(),
                ],
              ),
            ),
          ] : [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 6),
                  Text(subtitle, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildButton(),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Image.asset(
                imageAsset, 
                width: imageWidth ?? 80,
                height: imageHeight ?? 60, 
                fit: BoxFit.contain
              ),
            ),
          ],
        ),
      ),
    );
  }
}