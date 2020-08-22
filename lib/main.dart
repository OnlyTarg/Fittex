import 'package:fittex/widgets/new_transaction.dart';
import 'package:fittex/widgets/transaction_list.dart';
import 'package:fittex/widgets/user_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avdonin app')),
      body: Column(
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
          UserTransactions()
        ],
      ),
    );
  }
}
