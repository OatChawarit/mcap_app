import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyBox extends StatelessWidget {
  //const MoneyBox({Key? key}) : super(key: key);
  var BoxTitle;
  double BoxAmount;
  double BoxSize;

  MoneyBox(this.BoxTitle, this.BoxAmount, this.BoxSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
      height: BoxSize,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(BoxTitle, style: TextStyle(color: Colors.white, fontSize: 20)),
        Expanded(
          child: Text(
            "${NumberFormat("#,###.00").format(BoxAmount)}",
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
