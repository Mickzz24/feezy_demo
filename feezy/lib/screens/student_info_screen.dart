import 'package:flutter/material.dart';

class StudentInfoScreen extends StatelessWidget {
  final String name;
  final int totalPaid;
  final int dueAmount;
  final String dueDate;
  final String memberSince;
  const StudentInfoScreen({
    Key? key,
    required this.name,
    required this.totalPaid,
    required this.dueAmount,
    required this.dueDate,
    required this.memberSince,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example transaction data
    final transactions = [
      {'date': '18 - Oct - 2024', 'desc': 'Monthly Fees', 'amount': 1200.00},
      {'date': '18 - Oct - 2024', 'desc': 'Monthly Fees', 'amount': 1200.00},
      {'date': '18 - Oct - 2024', 'desc': 'Monthly Fees', 'amount': 1200.00},
      {'date': '18 - Oct - 2024', 'desc': 'Monthly Fees', 'amount': 1200.00},
      {'date': '18 - Oct - 2024', 'desc': 'Admission Fees', 'amount': 1200.00},
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(color: Colors.black),
          title: const Text(
            'Student Information',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF024C3C),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Member since $memberSince',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Divider(color: Colors.white30),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _StudentStat(title: 'Total Paid', value: '₹ $totalPaid'),
                          _StudentStat(title: 'Due Amount', value: '₹ $dueAmount'),
                          _StudentStat(title: 'Due Date', value: dueDate, isBold: true),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Transactions history
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text('Transactions history', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Center(
                child: Container(
                  width: 246,
                  height: 48,
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Color(0xFF024C3C),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 20), // 40px gap
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    tabs: const [
                      Tab(text: 'All'),
                      Tab(text: 'Paid'),
                      Tab(text: 'Pending'),
                    ],
                  ),
                ),
              ),
              
              SizedBox(
                height: 400, 
                child: TabBarView(
                  children: [
                    
                    _TransactionList(transactions: transactions),
                   
                    _TransactionList(transactions: transactions),
                    
                    _TransactionList(transactions: transactions),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _StudentStat extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  const _StudentStat({required this.title, required this.value, this.isBold = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _TransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;
  const _TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: transactions.map((txn) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFE5E5E5)),
          ),
          child: ListTile(
            title: Text(
              txn['date'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              txn['desc'] as String,
              style: const TextStyle(fontSize: 13),
            ),
            trailing: Text(
              '₹ ${(txn['amount'] as double).toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        );
      }).toList(),
    );
  }
} 