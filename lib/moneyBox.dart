import 'package:flutter/material.dart';

class MoneyBox extends StatelessWidget {
  //const MoneyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
      height: 120,
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: const [
        Text("รายการที่ 1 ค่างวด",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Expanded(
          child: Text(
            "1000",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ]),
    );
  }
}
