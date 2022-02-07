import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:project117/model/transaction.dart';

class ourtransactions_list extends StatelessWidget {
  final List<Transaction> transactions;

  ourtransactions_list(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "\$${tx.amount}",
                    // beacuse when we use $ in dart it means it trying to manipulate the string but i want to act that as symbol so this is simple concept to use it
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ), //need to convert because inside in text
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "${tx.title.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ), //need to convert because inside in text
                    ),
                    Container(
                      child: Text(
                        DateFormat('dd/mm/yyyy').format(tx.date),
                        // formatting our date
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ), //need to convert because inside in text
                    )
                  ],
                )
              ],
            ),
          );
        }).toList());
  }
}
