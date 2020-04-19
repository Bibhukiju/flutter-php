import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'addData.dart';
import 'details.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.white,),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> _getData() async {
    final res = await http.get("http://192.168.1.17/pasal/getdata.php");
    return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sangam MultiLight"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>NewData()));
          },
        ),
        body: FutureBuilder<List>(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("error");
            }
            if (snapshot.hasData) {
              return Items(list: snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        drawer: Drawer(
          elevation: 10,
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  final List list;
  Items({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            child: ListTile(
                leading: Icon(Icons.label),
                title: Text(list[index]["name"]),
                subtitle: Text(list[index]["price"]),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Details(list: list, index: index)))),
          );
        });
  }
}
