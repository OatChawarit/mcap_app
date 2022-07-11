import 'package:flutter/material.dart';

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({Key? key}) : super(key: key);

  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  @override
  var numbers = 1;
  var total = 0;

  Widget build(BuildContext context) {
    return Scaffold(
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
