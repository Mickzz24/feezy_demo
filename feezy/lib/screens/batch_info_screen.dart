import 'package:flutter/material.dart';
import 'members_list_screen.dart';

class BatchInfoScreen extends StatelessWidget {
  final String groupName;
  const BatchInfoScreen({Key? key, required this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: const Text(
          'Group information',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top green card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF024C3C),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Numans',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Divider(color: Colors.white30),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _BatchStat(title: 'Collected Amount', value: '₹ 98799'),
                        _BatchStat(title: 'Due Amount', value: '₹ 879'),
                        _BatchStat(title: 'Total Members', value: '70'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Monthly Payments
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Monthly Payments', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 16.0), // left: 22px, top: 16px
              child: SizedBox(
                height: 91,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _MonthlyPaymentCard(
                        month: 'May 01',
                        paid: 25,
                        total: 70,
                        collected: 19000,
                        due: 10000,
                        progress: 25 / 70,
                      ),
                      const SizedBox(width: 12),
                      _MonthlyPaymentCard(
                        month: 'June 01',
                        paid: 45,
                        total: 70,
                        collected: 32000,
                        due: 5000,
                        progress: 45 / 70,
                      ),
                      // Add more cards as needed
                    ],
                  ),
                ),
              ),
            ),
            // Members Row
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Members', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _memberCircle('A', Colors.green),
                  _memberCircle('D', Colors.orange),
                  _memberCircle('C', Colors.amber),
                  _memberCircle('M', Color(0xFF024C3C)),
                  const SizedBox(width: 8),
                  const Text(
                    '+64',
                    style: TextStyle(
                      fontFamily: 'Numans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MembersListScreen(totalMembers: 70),
                        ),
                      );
                    },
                    child: Icon(Icons.arrow_forward_ios, color: Color(0xFF064C3B), size: 20),
                  ),
                ],
              ),
            ),
            // Transactions history
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: const [
                  Text('Transactions history', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Spacer(),
                  Text('View All', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            // Transaction list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _TransactionTile(name: 'Anandu', date: '19 - Oct - 2024', amount: 1200.00),
                  _TransactionTile(name: 'Deepu', date: '19 - Oct - 2024', amount: 1200.00),
                  _TransactionTile(name: 'Athul', date: '19 - Oct - 2024', amount: 1200.00),
                  _TransactionTile(name: 'Jaanu', date: '19 - Oct - 2024', amount: 1200.00),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _BatchStat extends StatelessWidget {
  final String title;
  final String value;
  const _BatchStat({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}

class _MonthlyPaymentCard extends StatelessWidget {
  final String month;
  final int paid;
  final int total;
  final int collected;
  final int due;
  final double progress;
  const _MonthlyPaymentCard({
    required this.month,
    required this.paid,
    required this.total,
    required this.collected,
    required this.due,
    required this.progress,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 252,
      height: 91,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(month, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            color: Color(0xFF024C3C),
            minHeight: 6,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('Paid Members', style: TextStyle(color: Colors.blue, fontSize: 12)),
              Spacer(),
              Text('$paid / $total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          Row(
            children: [
              Text('Collected Amount', style: TextStyle(color: Colors.green, fontSize: 12)),
              Spacer(),
              Text('₹ $collected', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          Row(
            children: [
              Text('Due Amount', style: TextStyle(color: Colors.red, fontSize: 12)),
              Spacer(),
              Text('₹ $due', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _memberCircle(String letter, Color color) {
  return Container(
    margin: const EdgeInsets.only(right: 4),
    width: 32,
    height: 32,
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
          fontSize: 16,
          fontFamily: 'Numans',
        ),
      ),
    ),
  );
}

class _TransactionTile extends StatelessWidget {
  final String name;
  final String date;
  final double amount;
  const _TransactionTile({required this.name, required this.date, required this.amount});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('lib/assets/Group (3).png'), // Replace with user image if available
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date, style: const TextStyle(fontSize: 12)),
        trailing: Text('₹ ${amount.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
} 