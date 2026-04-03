import 'package:flutter/material.dart';

import 'home_dashboard.dart'; 

class TransactionScreen extends StatelessWidget {
  
  final List<Transaction>? transactions;
  
  const TransactionScreen({super.key, this.transactions});

  @override
  Widget build(BuildContext context) {
    
    final List<Transaction> displayList = (transactions == null || transactions!.isEmpty) 
      ? [
          Transaction(id: '1', title: 'Adobe Subscription', amount: 20.99, date: DateTime.now(), category: 'Software', type: TransactionType.expense),
          Transaction(id: '2', title: 'Upwork Payment', amount: 850.00, date: DateTime.now(), category: 'Freelance', type: TransactionType.income),
          Transaction(id: '3', title: 'Uber Ride', amount: 12.50, date: DateTime.now(), category: 'Transport', type: TransactionType.expense),
          Transaction(id: '4', title: 'Target Gym', amount: 45.00, date: DateTime.now(), category: 'Health', type: TransactionType.expense),
        ] 
      : transactions!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Transaction History", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.blue[50],
            child: Text(
              "Showing ${displayList.length} Transactions",
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
          ),
          
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              
              itemCount: displayList.length, 
              itemBuilder: (context, index) {
                final tx = displayList[index];
                final isExpense = tx.type == TransactionType.expense;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey[100]!),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isExpense ? Colors.red[50] : Colors.green[50],
                      child: Icon(
                        isExpense ? Icons.arrow_upward : Icons.arrow_downward,
                        color: isExpense ? Colors.red : Colors.green,
                        size: 18,
                      ),
                    ),
                    title: Text(tx.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(tx.category),
                    trailing: Text(
                      "${isExpense ? '-' : '+'}\$${tx.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isExpense ? Colors.red : Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}