import 'package:first_app/favourite_Quote.dart';
import 'package:first_app/search_Quote.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'author_Quote.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: const [
              SizedBox(width: 15,),
              Icon(Icons.collections_bookmark_outlined),
              SizedBox(width: 20,),
              Text(
                "Quotable",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 33),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey,
              )
            ],
          )
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20), primary: Colors.black
              ),
              child: const Text("  Author Quotes  ", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,)
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => authorScreen() ),);
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20), primary: Colors.black),
              child: const Text("  Search Quotes  ", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,)
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => searchScreen() ),);
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20),primary: Colors.black),
              child: const Text("Favourite Quotes", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,)
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => favouriteScreen() ),);
              },
            ),
          ],
        ),
      )
    );
  }
}
