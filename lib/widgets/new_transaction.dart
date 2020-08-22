import 'dart:ffi';

import 'package:flutter/material.dart';
import '../widgets/user_transaction.dart';

class NewTransaction extends StatelessWidget {
  Function _addTransaction;

  NewTransaction(this._addTransaction);

  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

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
              controller: titleControler,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Цена'),
              controller: amountControler,
            ),
            FlatButton(
              child: Text('Добавить покупку'),
              textColor: Colors.green,
              onPressed: () {
                _addTransaction(
                    titleControler.text, double.parse(amountControler.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
