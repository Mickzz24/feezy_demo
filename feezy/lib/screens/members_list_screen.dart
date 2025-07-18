import 'package:flutter/material.dart';
import 'student_info_screen.dart';

class MembersListScreen extends StatelessWidget {
  final int totalMembers;
  const MembersListScreen({Key? key, this.totalMembers = 70}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example member data
    final members = [
      {'name': 'Anandu Suresh', 'paid': 98799, 'due': 98799},
      {'name': 'Jayakrishnan', 'paid': 10000, 'due': 0},
      {'name': 'Anand', 'paid': 120000, 'due': 80000},
      {'name': 'Anupama', 'paid': 98799, 'due': 2000},
      {'name': 'Ahalya', 'paid': 4500, 'due': 1000},
      {'name': 'Jobin Jose', 'paid': 5600, 'due': 1200},
      {'name': 'Devika', 'paid': 4500, 'due': 1300},
      {'name': 'Goliath', 'paid': 60000, 'due': 3000},
      {'name': 'Hussan Darvish', 'paid': 6000, 'due': 5000},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Row(
          children: [
            const Text('Members', style: TextStyle(color: Colors.black)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xFF024C3C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                totalMembers.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 20, left: 23, right: 12, bottom: 8),
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Container(
            width: 351,
            height: 72, // was 69
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE5E5E5), width: 1),
            ),
            child: Row(
              children: [
                // Main content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16), // was 10
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          member['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4), // was 6
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.green, size: 10),
                            const SizedBox(width: 4),
                            const Text('Total paid', style: TextStyle(color: Colors.green, fontSize: 13)),
                            const SizedBox(width: 4),
                            Text(
                              member['paid'].toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            const SizedBox(width: 16),
                            Icon(Icons.circle, color: Colors.orange, size: 10),
                            const SizedBox(width: 4),
                            const Text('Total due', style: TextStyle(color: Colors.orange, fontSize: 13)),
                            const SizedBox(width: 4),
                            Text(
                              member['due'].toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Arrow icon
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentInfoScreen(
                            name: member['name'] as String,
                            totalPaid: member['paid'] as int,
                            dueAmount: member['due'] as int,
                            dueDate: '20/10/2024', // placeholder
                            memberSince: '12 Nov 2024', // placeholder
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 