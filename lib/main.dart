import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "McapApp",
      home: const MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var numbers = 1;
  var total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรแกรมนับเลข"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("กดปุ่มคูณแม่ 2"),
            Text(
              "2 * " + numbers.toString() + " = " + total.toString(),
              style: const TextStyle(fontSize: 60),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countNumber();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void countNumber() {
    setState(() {
      numbers++;

      if (total >= 24) {
        total = 2;
        numbers = 1;
      } else {
        total = 2 * numbers;
      }
    });
  }
}
