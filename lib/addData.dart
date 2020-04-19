import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class NewData extends StatefulWidget {
  @override
  _NewDataState createState() => _NewDataState();
}

TextEditingController cname = new TextEditingController();
TextEditingController cprice = new TextEditingController();

class _NewDataState extends State<NewData> {
  void addData() {
    var url = "http://192.168.1.17/pasal/adddata.php";
    http.post(url, body: {"name": cname.text, "price": cprice.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Items"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: <Widget>[
          TextField(
            controller: cname,
            decoration: InputDecoration(
              hintText: "Enter the item name",
              labelText: "Enter the item name",
            ),
          ),
          TextField(
            controller: cprice,
            decoration: InputDecoration(
              hintText: "Enter the item price",
              labelText: "Enter the item price",
            ),
          ),
          FlatButton(
            child: Text("ADD Data"),
            onPressed: () {
              addData();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyApp()));
            },
          )
        ],
      ),
    );
  }
}
