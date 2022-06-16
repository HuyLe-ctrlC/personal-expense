import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "My car", amount: 3000, dateTime: DateTime.now()),
    Transaction(
        id: "t2", title: "My monitor", amount: 1000, dateTime: DateTime.now()),
    Transaction(
        id: "t3", title: "My PC", amount: 5000, dateTime: DateTime.now()),
  ];

  // late String titleInput;
  // late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expense"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text(
                  "CHART!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                elevation: 5,
              ),
            ),
            Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Please fill something!",
                              labelText: "Title"),
                              controller: titleController,
                          // onChanged: (value) {
                          //   titleInput = value;
                          // },
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Please fill something!",
                              labelText: "Amount"),
                              controller: amountController,
                          // onChanged: (value) => amountInput = value,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: () {
                              print(titleController.text);
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ]),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: transactions.map((item) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 4,
                          ),
                        ),
                        child: Text(
                          item.amount.toString() + '\$',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(item.dateTime),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ]),
    );
  }
}
