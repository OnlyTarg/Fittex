

import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  Function _addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this._addTransaction);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0){
      print("зашел в исключение");

      return;
    }
    print('после исключения');


    _addTransaction(enteredTitle, enteredAmount);
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
              onSubmitted: (_)=>submitData(),
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
