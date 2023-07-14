import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
main( ) => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget{
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
      ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
      ),
  ];
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: const Card(
                  color: Colors.blue,
                  child: Text('Gráfico'),
                  elevation: 5,
                ),
              ),
              Column(
                children: _transactions.map((tr) {
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
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                  children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                    TextField(
                       decoration: InputDecoration(
                          labelText: 'Valor (R\$)',
                        ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.purple,
                          ),
                          child: Text('Nova Transação'),
                          onPressed: () {},
                        ),
                    ],
                    )
                  ],
                  ),
                ),
                ),
            ],
        ),
    );
  }
}