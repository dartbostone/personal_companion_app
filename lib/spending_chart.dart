import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpendingChart extends StatelessWidget {
  const SpendingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false), // Keeps it clean
        titlesData: const FlTitlesData(show: false), // Removes axis labels for a "mini" dashboard look
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 1200),
              const FlSpot(1, 900),
              const FlSpot(2, 1500),
              const FlSpot(3, 1100),
              const FlSpot(4, 2100),
              const FlSpot(5, 1800),
              const FlSpot(6, 2500),
            ],
            isCurved: true,
            color: Colors.blue[700],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.blue[700]!.withOpacity(0.3),
                  Colors.blue[700]!.withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}