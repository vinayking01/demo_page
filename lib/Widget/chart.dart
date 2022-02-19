import 'package:flutter/material.dart';
import 'package:project117/Widget/chartBar.dart';
import 'package:project117/model/transaction.dart';
import 'package:intl/intl.dart';

class chart extends StatelessWidget {
  // const chart({Key? key}) : super(key: key);
  final List<Transaction> recentTransaction;

  chart(this.recentTransaction);

  List<Map<String,Object>>get GroupedTransactionValues{
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
  double get totalSpending {
    return GroupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(GroupedTransactionValues);
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: GroupedTransactionValues.map((mydata){
              return Flexible(  // to handle the child flex element and alterante we can  use the Expanded property also
                  fit: FlexFit.tight,
                  child: ChartBar(mydata['day'],mydata['amount'],totalSpending == 0.0 ? 0.0 : (mydata['amount'] as double) / totalSpending,)); // chart value with amount is showing
            }).toList(),
          ),
        ),
      ),
    );

  }
}
