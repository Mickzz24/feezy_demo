import 'package:flutter/material.dart';
import 'creategroups.dart';
import 'homescreen.dart';
import 'payments_screen.dart';
import 'batch_info_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  String selectedBranch = 'Kollam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0, bottom: 8.0), // Increased top padding
            child: Row(
              children: [
                Text(
                  selectedBranch,
                  style: const TextStyle(
                    fontFamily: 'Numans',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Color(0xFF064C3B),
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF064C3B)),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Color(0xFF064C3B)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Color(0xFF064C3B)),
                  onPressed: () {},
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_none, color: Color(0xFF064C3B)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotificationScreen()),
                        );
                      },
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: 3,
        itemBuilder: (context, index) {
          final groupName = 'Morning Batch 1'; 
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BatchInfoScreen(groupName: groupName),
                ),
              );
            },
            child: Card(
              color: Colors.white, // Ensure white background
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFE5E5E5)),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF024C3C),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            groupName[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Numans',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          groupName,
                          style: const TextStyle(
                            fontFamily: 'Numans',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.savings, color: Color(0xFFFF6F61), size: 18),
                        const SizedBox(width: 4),
                        const Text(
                          'Collected Amount',
                          style: TextStyle(
                            fontFamily: 'Numans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '1200',
                          style: TextStyle(
                            fontFamily: 'Numans',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.savings, color: Color(0xFFFF6F61), size: 18),
                        const SizedBox(width: 4),
                        const Text(
                          'Due Amount',
                          style: TextStyle(
                            fontFamily: 'Numans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '200',
                          style: TextStyle(
                            fontFamily: 'Numans',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Members',
                      style: TextStyle(
                        fontFamily: 'Numans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildMemberCircle('A', Colors.orange),
                        _buildMemberCircle('D', Colors.green),
                        _buildMemberCircle('C', Colors.red),
                        _buildMemberCircle('M', Colors.blueGrey),
                        const SizedBox(width: 8),
                        const Text(
                          '+32',
                          style: TextStyle(
                            fontFamily: 'Numans',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFF064C3B), size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateGroupsScreen()),
          );
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            color: Color(0xFF064C3B),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.add, color: Colors.white, size: 32),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Groups tab
        selectedItemColor: Color(0xFF024C3C),
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
          // Do nothing for index == 1 (Groups)
        },
      ),
    );
  }

  Widget _buildMemberCircle(String letter, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            fontFamily: 'Numans',
          ),
        ),
      ),
    );
  }
} 