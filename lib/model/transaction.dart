// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Transaction {
  @required
  final String id;
  //required can be used by importing any material.dart , foundation.dart
  @required
  final String title;
  @required
  final double amount;
  @required
  final DateTime date;

  Transaction({this.id, this.title, this.amount, this.date}); //  this is named positional arguments used in constrcutor and it can be design by using curly braces
}
