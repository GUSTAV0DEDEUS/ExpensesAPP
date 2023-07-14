import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context){
    return Column(
      children: transactions.map((tr) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(156, 39, 176, 1),
                    width: 2
                  )
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.value.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(156, 39, 176, 1),

                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                  Text(
                    tr.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                  Text(
                    DateFormat('d MMM y').format(tr.date),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}