import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text("No transactions added yet!",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 40,
                ),
                Flexible(child: Image.asset("./images/waiting.png"))
              ],
            )
          : ListView(
              children: transactions.map((tx) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.all(6),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amber,
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text(
                              "\$${tx.amount}",
                              style: TextStyle(color: Colors.black),
                            )))),
                    title: Text(tx.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      DateFormat.yMMMMd("en_US").format(tx.date),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         constraints: BoxConstraints(minWidth: 88, maxWidth: 88),
                //         padding: const EdgeInsets.all(10),
                //         margin: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //           color: Theme.of(context).colorScheme.primary,
                //           width: 2,
                //         )),
                //         child: Text(
                //           '\$' "${tx.amount.toStringAsFixed(2)}",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //               color: Colors.black),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(tx.title,
                //               style: const TextStyle(
                //                   fontSize: 18, fontWeight: FontWeight.bold)),
                //           Text(DateFormat.yMMMMd("en_US").format(tx.date),
                //               style: const TextStyle(
                //                   color: Colors.grey, fontSize: 14)),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              }).toList(),
            ),
    );
  }
}
