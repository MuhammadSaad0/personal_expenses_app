import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/chart_bar.dart';
import 'package:flutter_complete_guide/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttxns;
  Chart(this.recenttxns);

  List<Map<String, Object>> get groupedTxns {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recenttxns.length; i++) {
        if (recenttxns[i].date.day == weekDay.day &&
            recenttxns[i].date.month == weekDay.month &&
            recenttxns[i].date.year == weekDay.year) {
          totalSum += recenttxns[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get totSpending {
    return groupedTxns.fold(0.0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTxns.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data["day"],
                  data["amount"],
                  totSpending == 0.0
                      ? 0.0
                      : (data["amount"] as double) / totSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
