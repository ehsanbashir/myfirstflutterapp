// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/BusinessList.dart';
import 'package:flutterapp/widgets/ProductList.dart';
void main() => runApp(MaterialApp(
  home: MyApp(),
));
const platform = const MethodChannel("crispchannel");
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Page',
      home: Scaffold(
        drawer: _loadDrawer(context),
        appBar: AppBar(
          title: Center(child: Text('Business Page')),
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
  Widget _loadDrawer(BuildContext context)
  {
    void _openCrispScreen() async {
      try {
        await platform.invokeMethod("startCrisp");
      } on PlatformException catch (_) {
        print("Failed to get crisp view.");
      }
    }
    var _txt = TextStyle(
      color: Colors.black,
      fontFamily: "Sans",
    );
    /// Get _txt and custom value of Variable for Name User
    var _txtName = _txt.copyWith(fontWeight: FontWeight.w700, fontSize: 17.0);

    /// Get _txt and custom value of Variable for Edit text
    var _txtEdit = _txt.copyWith(color: Colors.black26, fontSize: 15.0);
    var _profile = Padding(
      padding:  EdgeInsets.only(bottom: 280, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/ahsan.jpg"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Ahsan Ahmed",
                  style: _txtName,
                ),
              ),
              InkWell(
                onTap: null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    "Edit Profile",
                    style: _txtEdit,
                  ),
                ),
              ),
            ],
          ),
          Container(

          ),
        ],
      ),
    );

    return  Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          /// Setting Header Banner
          Container(
            height: 240.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/headerProfile.png"),
                    fit: BoxFit.cover)),
          ),
          /// Calling _profile variable
          _profile,
          Padding(
            padding: const EdgeInsets.only(top: 360.0),
            child: Column(
              /// Setting Category List
              children: <Widget>[
                /// Call category class
                category(
                  txt: "Sales",
                  padding: 35.0,
                  image: "assets/creditAcount.png",
                  tap: () {
                    Navigator.of(context).pop();
//                    Navigator.of(context).push(
//                        PageRouteBuilder(
//                        pageBuilder: (_, __, ___) => new notification()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 85.0, right: 30.0),
                  child: Divider(
                    color: Colors.black12,
                    height: 2.0,
                  ),
                ),
                category(
                  txt: " Support",
                  padding: 35.0,
                  image: "assets/notification.png",
                  tap: () {
                    _openCrispScreen();
//                    Navigator.of(context).push(PageRouteBuilder(
//                        pageBuilder: (_, __, ___) =>
//                        new creditCardSetting()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 85.0, right: 30.0),
                  child: Divider(
                    color: Colors.black12,
                    height: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }
}

class category extends StatelessWidget {
  @override
  String txt, image;
  GestureTapCallback tap;
  double padding;

  category({this.txt, this.image, this.tap, this.padding});

  Widget build(BuildContext context) {
    var _txt = TextStyle(
      color: Colors.black,
      fontFamily: "Sans",
    );
    var _txtCategory = _txt.copyWith(
        fontSize: 14.5, color: Colors.black54, fontWeight: FontWeight.w500);
    return InkWell(
      onTap: tap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 30.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: Image.asset(
                    image,
                    height: 25.0,
                  ),
                ),
                Text(
                  txt,
                  style: _txtCategory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
