import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget._addTransaction(enteredTitle, enteredAmount);
    Navigator.of(context).pop();


  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Наименование'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Цена'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Добавить покупку'),
              textColor: Colors.green,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
