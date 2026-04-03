import 'package:flutter/material.dart';
import 'home_dashboard.dart'; 
import 'challenge.dart';
import 'transaction.dart';


void main() {
  runApp(const MyFinanceApp(
     
  ));
}

class MyFinanceApp extends StatelessWidget {
  const MyFinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Companion',
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      
    
      
      home: MainNavigationWrapper(),
    );
  }
}
class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _selectedIndex = 0;

  
  final List<Widget> _pages = [
    const HomeDashboard(),         
    const TransactionScreen(transactions: []), 
    const ChallengeScreen(),       
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: Container(
          key: ValueKey<int>(_selectedIndex),
          child: _pages[_selectedIndex],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, 
        
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), 
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long), 
            label: 'Transactions'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events), 
            label: 'Challenges'
          ),
        ],
      ),
      
    );
  }
}