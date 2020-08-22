import 'package:flutter/cupertino.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  DateTime dateTime;

  Transaction(@required this.id, @required @required this.title, @required this.amount, @required this.dateTime);
}
