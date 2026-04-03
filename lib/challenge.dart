import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Challenges & Goals", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActiveChallenge(),
            const SizedBox(height: 30),
            const Text("Available Challenges", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildChallengeTile("Coffee Free Week", "Save \$35 by making coffee at home", "7 days", Colors.brown),
            _buildChallengeTile("Subscription Purge", "Cancel 2 unused subscriptions", "Ongoing", Colors.purple),
            const SizedBox(height: 30),
            const Text("Recent Achievements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildAchievementBadge("Savings Starter", Icons.auto_awesome),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveChallenge() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.orange[400],
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: const Column(
        children: [
          Icon(Icons.local_fire_department, color: Colors.white, size: 48),
          SizedBox(height: 12),
          Text("Current Streak: 5 Days", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          Text("No-Spend Weekend Challenge", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildChallengeTile(String title, String sub, String time, Color color) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey[200]!)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(Icons.bolt, color: color)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sub),
        trailing: Text(time, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }

  Widget _buildAchievementBadge(String label, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 15),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}