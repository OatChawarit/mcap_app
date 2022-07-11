import 'package:flutter/material.dart';
import 'moneyBox.dart';

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({Key? key}) : super(key: key);

  @override
  State<MyHomeWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomeWidget> {
  @override
  var numbers = 1;
  var total = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "2 * $numbers = $total",
                      style: const TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              MoneyBox(),
              // Container(
              //     child: Center(
              //         child: ListView(
              //   shrinkWrap: true,
              //   padding: const EdgeInsets.all(20.0),
              //   children: getData(5),
              // ))),
            ],
          ),
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

  List<Widget> getData(int count) {
    List<Widget> data = [];
    for (var i = 1; i < count; i++) {
      var menuList = ListTile(title: Text("รายการที่ $i"));
      data.add(menuList);
    }
    return data;
  }
}
