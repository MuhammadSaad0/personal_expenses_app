import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deltxn;
  TransactionList(this.transactions, this.deltxn);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Color.fromRGBO(0, 0, 0, .3),
      //       offset: Offset(0, 10),
      //       blurRadius: 7,
      //       spreadRadius: 5,
      //     )
      //   ],
      // ),
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
                      trailing: MediaQuery.of(context).size.width > 350
                          ? TextButton.icon(
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).errorColor,
                              ),
                              label: Text(
                                "Delete",
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ),
                              onPressed: () {},
                            )
                          : IconButton(
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                              onPressed: () => deltxn(tx.id),
                            ),
                    ));
              }).toList(),
            ),
    );
  }
}
