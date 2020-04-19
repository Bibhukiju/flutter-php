import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final List list;
  final int index;
  Details({this.list, this.index});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list[widget.index]["name"]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                  ),
                ],
                color: Colors.white,
              ),
              height: 200,
              width: 200,
              child: Center(
                child: Text("${widget.list[widget.index]["price"]}"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.edit),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
