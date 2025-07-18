import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'homescreen.dart';
import 'groupscreen.dart';
import 'payments_screen.dart';
import 'branches_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Green header with profile info and edit button
          Container(
            width: double.infinity,
            color: const Color(0xFF024C3C),
            padding: const EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile avatar
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, color: Color(0xFF024C3C), size: 36),
                ),
                const SizedBox(width: 16),
                // Name and subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Adarsh C M',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Devdexign',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                // Edit button
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF4B7268),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // KYC Details
          _ProfileTile(
            icon: Icons.verified_user,
            label: 'KYC Details',
            onTap: () {},
          ),
          // Branches
          _ProfileTile(
            icon: Icons.groups,
            label: 'Branches',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BranchesScreen()),
              );
            },
            trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF024C3C), size: 20),
          ),
          // Privacy Policy
          _ProfileTile(
            icon: Icons.policy,
            label: 'Privacy Policy',
            onTap: () {},
            trailing: const Icon(Icons.open_in_new, color: Color(0xFF024C3C), size: 20),
          ),
          // Logout
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F8F7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Color(0xFF024C3C)),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Color(0xFF024C3C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: const Color(0xFF024C3C),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => GroupScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PaymentsScreen()),
            );
          }
          // Do nothing for index == 3 (Profile)
        },
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Widget? trailing;
  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E5E5)),
        ),
        child: ListTile(
          leading: Icon(icon, color: const Color(0xFF024C3C)),
          title: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF024C3C),
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }
} 