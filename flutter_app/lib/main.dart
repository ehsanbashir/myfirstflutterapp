// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.



import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/BusinessList.dart';
import 'package:flutterapp/widgets/ProductList.dart';
void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductList()),
                  );
                },
                child: new Text("Search Product(s)"),
              ),
              Expanded(
                child: BusinessedList(),
              ),



            ],
          ),
        ),
      ),
    );
  }
}


