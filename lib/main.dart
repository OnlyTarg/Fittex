import 'package:fittex/widgets/chart.dart';
import 'package:fittex/widgets/new_transaction.dart';
import 'package:fittex/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'models/transaction.dart';

void main() {
/*  var currentDate= DateTime.now();
  var fixDate = DateFormat.E(currentDate);
  print(fixDate);*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
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

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double price) {
    final newTx =
        Transaction(DateTime.now().toString(), title, price, DateTime.now());
    print('добавлено' + newTx.title + ' - ' + newTx.amount.toString());

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
            Chart(_recentTransactions),
            /*Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 100,
                color: Colors.blue,
                width: 300,
                child: Card(
                  child: Text('Privet1'),
                ),
              ),
            ),*/
            _userTransaction.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text('Nothing add yet'),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/images/cat.jpg',
                        fit: BoxFit.cover,
                      )
                    ]),
                  )
                : TransactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext blx) {
                print('before ' + 'return new transaction');
                return NewTransaction(_addTransaction);
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
