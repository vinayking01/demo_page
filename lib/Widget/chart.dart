import 'package:flutter/material.dart';
import 'package:project117/model/transaction.dart';
import 'package:intl/intl.dart';

class chart extends StatelessWidget {
  // const chart({Key? key}) : super(key: key);
  final List<Transaction> recentTransaction;

  chart(this.recentTransaction);

  List<Map<String,Object>>get GroupedTrasactionValues{
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index),); // subtracting days from previuos day
      var totalsum=0.0;
      for(var i=0;i<recentTransaction.length;i++)
      {
        if(recentTransaction[i].date.day==weekDay.day
            && recentTransaction[i].date.month==weekDay.month
            && recentTransaction[i].date.year==weekDay.year)
          {
            totalsum = recentTransaction[i].amount+totalsum;
          }
      }

      print(DateFormat.E().format(weekDay).substring(0,1));
      print(totalsum);
      return {'day':DateFormat.E().format(weekDay),'amount':totalsum};// date format.E is used to give shortcut directly


    });
  }

  @override
  Widget build(BuildContext context) {
    print(GroupedTrasactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        children: GroupedTrasactionValues.map((mydata){
          return Text('${mydata['day']} : ${mydata['amount']}'); // chart value with amount is showing
        }).toList(),
      ),
    );

  }
}
