import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'transaction.dart';



enum TransactionType { income, expense }

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final TransactionType type;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });
}
class SavingsGoal {
  final String title;
  final double targetAmount;
  final double currentAmount;
  final int daysLeft;

  SavingsGoal({
    required this.title, 
    required this.targetAmount, 
    required this.currentAmount, 
    required this.daysLeft
  });

  double get progress => currentAmount / targetAmount;
}





class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const double currentBalance = 5000.00;
    const double totalIncome = 8000.00;
    const double totalExpenses = 2000.00;
    const double savingsProgress = 0.65;

    
    final List<Transaction> mockTransactions = [
      Transaction(id: '1', title: 'Rent', amount: 900, date: DateTime.now(), category: 'Housing', type: TransactionType.expense),
      Transaction(id: '2', title: 'Salary', amount: 40000, date: DateTime.now(), category: 'Pay', type: TransactionType.income),
      Transaction(id: '3', title: 'Groceries', amount: 120, date: DateTime.now(), category: 'Food', type: TransactionType.expense),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("My Finances", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildBalanceCard(currentBalance, totalIncome, totalExpenses),
            const SizedBox(height: 24),
            _buildSectionTitle("Savings Goal"),
            const SizedBox(height: 12),
            _buildSavingsProgressCard("Emergency Fund", savingsProgress),
            const SizedBox(height: 24),
            _buildSectionTitle("Spending Trend"),
            const SizedBox(height: 12),
            _buildChartContainer(),
            const SizedBox(height: 24),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle("Recent Activity"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionScreen(transactions: mockTransactions),
                      ),
                    );
                  },
                  child: const Text("See All"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildTransactionList(mockTransactions),
            const SizedBox(height: 100), 
          ],
        ),
      ),
    );
  }

  

  Widget _buildBalanceCard(double balance, double income, double expenses) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[900]!, Colors.blue[700]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text("Current Balance", style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 8),
          Text("\$${balance.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatColumn("Total Income", income, Icons.arrow_downward, Colors.greenAccent),
              Container(width: 1, height: 30, color: Colors.white24),
              _buildStatColumn("Expenditure", expenses, Icons.arrow_upward, Colors.orangeAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(List<Transaction> transactions) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];
        final isExpense = tx.type == TransactionType.expense;
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: isExpense ? Colors.red[50] : Colors.green[50],
                child: Icon(isExpense ? Icons.arrow_upward : Icons.arrow_downward, color: isExpense ? Colors.red : Colors.green, size: 18),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(tx.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(tx.category, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ])),
              Text("${isExpense ? '-' : '+'}\$${tx.amount.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, color: isExpense ? Colors.red : Colors.green)),
            ],
          ),
        );
      },
    );
  }

  void _showAddTransactionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 20, left: 20, right: 20, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Add Transaction", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const TextField(decoration: InputDecoration(labelText: "Title")),
            const TextField(decoration: InputDecoration(labelText: "Amount"), keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Save Transaction")),
          ],
        ),
      ),
    );
  }

  Widget _buildSavingsProgressCard(String title, double progress) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[200]!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text("${(progress * 100).toInt()}%", style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(value: progress, minHeight: 10, backgroundColor: Colors.grey[200], valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue)),
          ),
        ],
      ),
    );
  }

  Widget _buildChartContainer() {
    return Container(
      height: 200,
      padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[200]!)),
      child: LineChart(LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [const FlSpot(0, 1), const FlSpot(1, 3), const FlSpot(2, 2), const FlSpot(3, 5), const FlSpot(4, 3), const FlSpot(5, 4)],
            isCurved: true, color: Colors.blue, barWidth: 4, belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.1)),
          ),
        ],
      )),
    );
  }

  Widget _buildStatColumn(String label, double amount, IconData icon, Color color) {
    return Column(children: [
      Row(children: [Icon(icon, size: 14, color: color), const SizedBox(width: 4), Text(label, style: const TextStyle(color: Colors.white70))]),
      Text("\$${amount.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ]);
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }
}


