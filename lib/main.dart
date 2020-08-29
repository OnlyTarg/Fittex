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
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white))),
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

  void _addTransaction(String title, double price, DateTime dateTime) {
    final newTx =
        Transaction(DateTime.now().toString(), title, price, dateTime);

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
