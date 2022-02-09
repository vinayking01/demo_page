import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addtx;
  NewTransaction(this.addtx);

  void submitData()
  {
    final enteredtitle = titlecontroller.text;
    final enteredamount =  amountcontroller.text;

    if(enteredtitle.isEmpty || enteredamount.isEmpty || double.parse(enteredamount )< 0)  //some validation is added
      {
        return;
      }
    addtx(enteredtitle,double.parse(enteredamount)); //(double.parse) is used to convert it from string to double
  }
  final titlecontroller = TextEditingController();  //creating controller by calling it  (it is alternate of onchanged)
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
              // onSubmitted: (_)=> submitData(),
              controller: titlecontroller,  //this is controller which is used by flutter directly to connect to the input field and track the changes on input field
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              // onChanged: (textAmountInputByUserInTheFeild){  //
              //   amountInput = textAmountInputByUserInTheFeild;
              // },
              keyboardType:TextInputType.number,
              // onSubmitted: (_)=> submitData(),//in this textfield it will only show the keyboard related to the numbers
              controller: amountcontroller,
            ),
            FlatButton(
              onPressed:submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}

