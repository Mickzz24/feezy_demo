import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'groupscreen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final payments = List.generate(5, (index) => {
      'name': 'Anandu',
      'amount': 200,
      'feeType': 'Admission Fee',
      'dueDate': '18 Oct 2024',
    });

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            color: const Color(0xFF024C3C),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Kollam', style: TextStyle(color: Colors.white, fontSize: 18)),
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.white),
                          onPressed: () {},
                        ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Transactions history', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            const SizedBox(height: 16),
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
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Paid'),
                    Tab(text: 'Pending'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                children: [
                  _PaymentsList(payments: payments),
                  _PaymentsList(payments: payments),
                  _PaymentsList(payments: payments),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2, // Payments tab
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
            } else if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            }
            // Do nothing for index == 2 (Payments)
          },
        ),
      ),
    );
  }
}

class _PaymentsList extends StatelessWidget {
  final List<Map<String, dynamic>> payments;
  const _PaymentsList({required this.payments});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: payments.length,
      itemBuilder: (context, index) {
        final payment = payments[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      payment['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF024C3C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '₹ ${payment['amount']}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.emoji_events, color: Color(0xFFFFB300), size: 18), // Use your fee icon asset if available
                    const SizedBox(width: 4),
                    Text(
                      payment['feeType'],
                      style: const TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                    const Spacer(),
                    Text(
                      'Due from ${payment['dueDate']}',
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.notifications_active, color: Color(0xFF024C3C), size: 16),
                    const SizedBox(width: 4),
                    const Text('Send Reminders', style: TextStyle(fontSize: 13, color: Color(0xFF024C3C))),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.black54),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => PaymentMarkPaidSheet(
                            name: payment['name'],
                            amount: payment['amount'],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PaymentMarkPaidSheet extends StatefulWidget {
  final String name;
  final int amount;
  const PaymentMarkPaidSheet({Key? key, required this.name, required this.amount}) : super(key: key);

  @override
  State<PaymentMarkPaidSheet> createState() => _PaymentMarkPaidSheetState();
}

class _PaymentMarkPaidSheetState extends State<PaymentMarkPaidSheet> {
  int? _selectedMethod;
  final List<String> _methods = ['Cash', 'Bank Transfer', 'UPI Transfer'];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.3,
      maxChildSize: 0.7,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 28, color: Colors.black38),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to mark ₹${widget.amount} from ${widget.name.toLowerCase()} as paid?',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFFE5E5E5)),
                ),
                child: Column(
                  children: List.generate(_methods.length, (i) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(_methods[i]),
                          trailing: Radio<int>(
                            value: i,
                            groupValue: _selectedMethod,
                            onChanged: (val) {
                              setState(() => _selectedMethod = val);
                            },
                            activeColor: Color(0xFF024C3C),
                          ),
                          onTap: () => setState(() => _selectedMethod = i),
                        ),
                        if (i < _methods.length - 1)
                          const Divider(height: 1, color: Color(0xFFE5E5E5)),
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFE5E5E5)),
                ),
                child: const Text(
                  'Add a note',
                  style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle confirm
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF024C3C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
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
} 