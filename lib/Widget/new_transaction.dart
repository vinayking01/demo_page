import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  DateTime selectdate;
  void submitData() {
    final enteredtitle = titlecontroller.text;
    final enteredamount = amountcontroller.text;


    if (enteredtitle.isEmpty ||
        enteredamount.isEmpty ||
        double.parse(enteredamount) < 0) //some validation is added
    {
      return;
    }
    widget.addtx(
        //this is automatically converted into this to create connection our directly properties
        enteredtitle,
        double.parse(enteredamount),
        selectdate,);

    //(double.parse) is used to convert it from string to double
    Navigator.of(context)
        .pop(); //to off the scren automatically on adding and  this will be called from  the inputfield not from add transaction button
  }

  void Datepicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()
    ).then((pickeddate){  // after picking the date it sholud be visible on screen that is choosed we use then which is future function
      if(pickeddate==null)
        {
          return ;
        }
      setState(() {
        selectdate = pickeddate;
      });
    });
  }

  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              // onChanged: (String textInputByUserInTheFeild){    //Onchganged- this is property which refer to initiates the changes to the input fields
              //   // it needs a function which taking a input from user by default it is always string
              //       titleInput = textInputByUserInTheFeild; // storing the value entered in the inputfield
              // },
              onSubmitted: (_) => submitData(),
              controller: titlecontroller,

              //this is controller which is used by flutter directly to connect to the input field and track the changes on input field
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              // onChanged: (textAmountInputByUserInTheFeild){  //
              //   amountInput = textAmountInputByUserInTheFeild;
              // },
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //in this textfield it will only show the keyboard related to the numbers
              controller: amountcontroller,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 25),
              child: Row(
                children: <Widget>[
                  Text(selectdate==null ? "Date not choosen": DateFormat.yMd().format(selectdate)),
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      onPressed: Datepicker,
                      child: Text(
                        "Choose date",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
