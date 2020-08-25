import 'package:fittex/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {

  List<Transaction> _userTransaction;


  TransactionList(this._userTransaction);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 700,
      child: SingleChildScrollView(
        child: Column(
          children: _userTransaction.map((tx) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '\$${tx.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          tx.title,
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          child: Text(
                        DateFormat.yMMMMEEEEd().format(tx.dateTime),
                        style: TextStyle(color: Colors.grey),
                      ))
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.all(10),
                )
              ],
            ));
          }).toList(),
        ),
      ),
    );
  }
}
