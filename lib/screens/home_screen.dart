import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listNumbers = <int>[];
  var counter = 0;
  void _incrementCounter() {
    setState(() {
      //TODO: Cambiar por el numero del bingo
      counter = Random().nextInt(10);
      print("Numero generado $counter");
      listNumbers.add(counter);
      print("Numeros $listNumbers");
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            width: size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Text(
              "$counter",
              style: const TextStyle(fontSize: 200),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: size.width * 0.3,
            child: table(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget table() {
    var color = Colors.grey;
    return GridView.builder(
      //TODO: Cambiar por el numero del bingo
      itemCount: 100,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
      itemBuilder: (context, index) => GestureDetector(
        onTap: (() => setState(() {
              color = Colors.green;
            })),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Text(
            "$index",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
