import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterapp/models/Product.dart';
import 'package:flutterapp/services/webservice.dart';

import 'Business.dart';



class ProductList extends StatefulWidget {

  @override
  createState() => ProductListState();
}
class ProductListState extends State<ProductList>{
  bool isFullScreenDialog = true;
  List<Value> _product = List<Value>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }


  void _populateNewsArticles() {

    Webservice().load(Value.all,'*').then((newsArticles) => {
      setState(() => {
        _product = newsArticles,
        isFullScreenDialog = false,
      })
    });

  }

  Widget _buildItemsForListView(BuildContext context, int index) {
    if(_product[index].imageurl == null || _product[index].imageurl=="")
      _product[index].imageurl = 'https://image.freepik.com/free-vector/watercolor-background_87374-69.jpg';
    return
    GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Business(product: _product[index]),
          ));
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => Business(product: _product[index]),
//            ),
//          );
        },

        child: Container(
          height: 130,
          child: Card(
            elevation: 10,
            child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                            _product[index].imageurl,
                        ),
                      )

                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          SizedBox(height: 20),
                          new Text(
                            _product[index].barcode != null ? _product[index].barcode: "No Data",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          new Text(
                            _product[index].primaryName,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),

                ]
            ),
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Center(
           child:Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a search term'
                  ),
                  onChanged: (text) {
                    if(text.length>3)
                      {

                      _populateNewsArticles();
                    }
                  }
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _product.length,
                    itemBuilder: _buildItemsForListView,
                  ),
                )

              ],
           )
        ),
    );
  }
}