import 'package:fittex/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> _userTransaction;
  Function delTransaction;

  TransactionList(this._userTransaction, this.delTransaction);

  @override
  Widget build(BuildContext context) {


    // print(Text(MediaQuery.of(context).size.height.toString()));
    return _userTransaction.isEmpty ?
        LayoutBuilder(builder: (context,constrains){
          return Container(
            alignment: Alignment.center,
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text('Nothing add yet'),
              SizedBox(
                height: 20,
              ),
              Container(
                height: constrains.maxHeight*0.7,
                child: Image.asset(
                  'assets/images/cat.jpg',
                  fit: BoxFit.cover,
                ),
              )
            ]),
          );
        },)
     : SingleChildScrollView(
      child: Column(
        children: _userTransaction.map((tx) {
          return Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              //contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              title: Text(tx.title),
              leading: CircleAvatar(
                radius: 60,
                child: Text(
                  tx.amount.toString(),
                ),
              ),
              subtitle: Text(DateFormat.yMMMMEEEEd().format(tx.dateTime)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => delTransaction(tx.id),
              ),
            ),
          );


        }).toList(),
      ),
    );
  }
}
