import '../models/transaction.dart';
import 'package:flutter/material.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
  }


class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction('1', 'Кросы', 15, DateTime.now()),
    Transaction('2', 'Футюолка', 25, DateTime.now()),
  ];




  void _addTransaction(String title, double price){
    final newTx = Transaction(DateTime.now().toString(),title, price, DateTime.now());
    _userTransaction.add(newTx);

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NewTransaction(_addTransaction),
          TransactionList(_userTransaction),
        ],
      ),
    );
  }
}
