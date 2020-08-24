import 'package:fittex/widgets/new_transaction.dart';
import 'package:fittex/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    Transaction('1', 'Кросы', 15, DateTime.now()),
    Transaction('2', 'Футюолка', 25, DateTime.now()),
  ];

  void _addTransaction(String title, double price) {
    final newTx =
        Transaction(DateTime.now().toString(), title, price, DateTime.now());
      print('добавлено' + newTx.title + ' - ' + newTx.amount.toString() );


    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avdonin app')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 100,
                color: Colors.blue,
                width: 300,
                child: Card(
                  child: Text('Privet1'),
                ),
              ),
            ),
            TransactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext blx) {
                print('before '+'return new transaction');
                return NewTransaction(_addTransaction);


              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
