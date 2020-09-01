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
  bool switchStatus = true;

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

  void _delTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation==Orientation.landscape;
    final appBar = AppBar(title: Text('Avdonin app'));
    var standartsize = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final txListWidget = Container(
        height: standartsize * 0.7,
        child: TransactionList(_userTransaction, _delTransaction));



    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show CHART'),
                Switch(
                    value: switchStatus,
                    onChanged: (val) {
                      setState(() {
                        switchStatus = val;
                      });
                    })
              ],
            ),

            if(!isLandscape) Container(
                height: standartsize * 0.3,
                child: Chart(_recentTransactions)),
            if (!isLandscape)  txListWidget,
            if (isLandscape)
            switchStatus
                ? Container(
                    height: standartsize * 0.3,
                    child: Chart(_recentTransactions))
                : txListWidget,
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
