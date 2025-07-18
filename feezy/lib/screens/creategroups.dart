import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class CreateGroupsScreen extends StatefulWidget {
  const CreateGroupsScreen({Key? key}) : super(key: key);

  @override
  State<CreateGroupsScreen> createState() => _CreateGroupsScreenState();
}

class _CreateGroupsScreenState extends State<CreateGroupsScreen> {
  final TextEditingController _batchNameController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final List<String> members = ['Anandu', 'Kannan sivaprasad', 'Balu'];
  final Map<String, TextEditingController> _memberAmountControllers = {};

  @override
  void initState() {
    super.initState();
    for (var m in members) {
      _memberAmountControllers[m] = TextEditingController();
    }
  }

  @override
  void dispose() {
    _batchNameController.dispose();
    _dueDateController.dispose();
    _amountController.dispose();
    for (var c in _memberAmountControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dueDateController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Create Groups',
                    style: TextStyle(
                      fontFamily: 'Numans',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Group your students for better\nmanagement and fee tracking',
                style: TextStyle(
                  fontFamily: 'Numans',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color(0xFF8B8B8B),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  color: Color(0xFFBDBDBD),
                  dashPattern: [4, 3],
                  strokeWidth: 1.5,
                  child: Container(
                    width: 56,
                    height: 56,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                      color: Color(0xFFBDBDBD),
                      size: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _batchNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter batch name',
                  hintStyle: TextStyle(
                    fontFamily: 'Numans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
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
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: _dueDateController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today, color: Color(0xFFBDBDBD)),
                      hintText: 'Select payment collection due date',
                      hintStyle: TextStyle(
                        fontFamily: 'Numans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
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
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.currency_rupee, color: Color(0xFFBDBDBD)),
                  hintText: 'Amount due',
                  hintStyle: TextStyle(
                    fontFamily: 'Numans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
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
              Row(
                children: [
                  Icon(Icons.add_circle_outline, color: Color(0xFF8B8B8B)),
                  const SizedBox(width: 4),
                  const Text(
                    'Members',
                    style: TextStyle(
                      fontFamily: 'Numans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF064C3B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      members.length.toString(),
                      style: const TextStyle(
                        fontFamily: 'Numans',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...members.map((m) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        m,
                        style: const TextStyle(
                          fontFamily: 'Numans',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Text(
                      '₹',
                      style: TextStyle(
                        fontFamily: 'Numans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: 80,
                      child: TextField(
                        controller: null, // You can use _memberAmountControllers[m] if you want to store values
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle create action here
                  },
                  child: Image.asset(
                    'lib/assets/Button (6).png',
                    width: 240, // Adjust width as needed
                    height: 56, // Adjust height as needed
                    fit: BoxFit.contain,
                  ),
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