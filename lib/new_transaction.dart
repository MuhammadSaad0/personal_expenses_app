import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addnewtxn;
  NewTransaction(this.addnewtxn);

  void submitData() {
    final enteredTitle = titleController.text;
    final eneteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || eneteredAmount <= 0) {
      return;
    }
    addnewtxn(enteredTitle, eneteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title")),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Amount"),
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
            onPressed: submitData,
            child: Text("Add transaction"),
            style: TextButton.styleFrom(primary: Colors.purple),
          )
        ]),
      ),
    );
  }
}
