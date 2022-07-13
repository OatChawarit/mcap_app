import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'moneyBox.dart';
import 'listPost.dart';

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({Key? key}) : super(key: key);

  @override
  State<MyHomeWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomeWidget> {
  @override
  int numbers = 1;
  int total = 0;

  Future<List<ListPost>> listPost = getData();
  //ดึงข้อมูลแล้วนำมาแปลงจาก Json to dart listview
  static Future<List<ListPost>> getData() async {
    const url = "https://jsonplaceholder.typicode.com/comments?postId=1";
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<ListPost>(ListPost.fromJson).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        numbers++;
        print(numbers);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: FutureBuilder<List<ListPost>>(
              future: listPost,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final postdata = snapshot.data!;
                  return buildPosts(postdata);
                } else {
                  return Text("Connection Error..!");
                }
              }),
          //Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: getData(5),
          // [
          // Container(
          //     width: 250,
          //     height: 250,
          //     decoration: const BoxDecoration(
          //         color: Colors.red, shape: BoxShape.circle),
          //     child: Center(
          //       child: Text(
          //         "2 * $numbers = $total",
          //         style: const TextStyle(
          //           fontSize: 60,
          //           color: Colors.white,
          //         ),
          //       ),
          //     )),
          // SizedBox(height: 10),
          // MoneyBox("ค่างวด 1", 17200.75, 100),
          // SizedBox(height: 10),
          // MoneyBox("ค่างวด 2", 17200.75, 100),
          // Container(
          //     child: Center(
          //         child: ListView(
          //   shrinkWrap: true,
          //   padding: const EdgeInsets.all(20.0),
          //   children: getData(5),
          // ))),
          //],
          //),
        ),
      ),
    )
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     countNumber();
        //   },
        //   child: const Icon(Icons.add),
        // ),
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

  Widget buildPosts(List<ListPost> listPost) => ListView.builder(
        itemCount: listPost.length,
        itemBuilder: (context, index) {
          final postdata = listPost[index];
          return Card(
              color: Color.fromARGB(255, 255, 208, 208),
              child: ListTile(
                  title: Text(postdata.name), subtitle: Text(postdata.email)));
        },
      );

  // List<Widget> getData(int count) {
  //   List<Widget> dataList = [];
  //   for (var i = 1; i < count; i++) {
  //     var menuList =
  //         ListTile(title: Text("ISH-000$i"), subtitle: Text("ค่างวด"));
  //     dataList.add(menuList);
  //   }
  //   return dataList;
  // }
}
