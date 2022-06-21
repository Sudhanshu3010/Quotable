import 'package:flutter/material.dart';

class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: const [
              Icon(Icons.collections_bookmark_outlined),
              SizedBox(width: 20,),
              Text(
                " Quotable",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 33),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey,
              )
            ],
          ),
        ),
        body: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey),
          child: Row(children: const [
            SizedBox(height: 40),
            SizedBox(width: 80),
            Text(
              "Search Quotes",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )
          ]),
        )
    );
  }
}