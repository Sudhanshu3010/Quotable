import 'dart:convert';

import 'package:first_app/quote.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'main.dart';

class authorScreen extends StatefulWidget {
  @override
  State<authorScreen> createState() => _authorScreenState();
}

class _authorScreenState extends State<authorScreen> {
  Future<List<Quotes>> getallQuotes() async {
    var url = Uri.parse(
        'https://api.quotable.io/search/quotes?query=life%20happiness');
    Response response = await get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('success');
      var jsonData = json.decode(response.body);
      var jsonArray = jsonData['results'];
      // print(jsonArray);
      List<Quotes> quotes = [];
      for (var jsonQuotes in jsonArray) {
        Quotes quote = Quotes(
            author: jsonQuotes['author'], content: jsonQuotes['content']);
        quotes.add(quote);
      }
      return quotes;
    } else {
      print('Oops! Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: const [
              Icon(Icons.collections_bookmark_outlined),
              SizedBox(
                width: 20,
              ),
              Text(
                " Quotable",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 33),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey,
              )
            ],
          ),
        ),
        body: FutureBuilder<List<Quotes>>(
          future: getallQuotes(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Quotes> quotes = snapshot.data;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: quotes.length,
                  itemBuilder: (context, i) {
                    Quotes quote = quotes[i];
                    return Container(
                      //height: 45,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            quote.content,
                            style: const TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            quote.author,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  });
            }
          },
        ));
  }
}
