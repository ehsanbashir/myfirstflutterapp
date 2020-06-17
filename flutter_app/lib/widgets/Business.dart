
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/database_helper.dart';
import 'package:flutterapp/models/Product.dart';
import 'package:flutterapp/services/webservice.dart';
import 'package:flutterapp/models/invoice.dart';
import 'package:uuid/uuid.dart';
class Business extends StatelessWidget {
  final Value product;

  Business({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      title: "App Title",
      home:  Scaffold(
        appBar: AppBar(
            title: Text(product.businessPrimaryName),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white, size: 16.0,),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            _BusinessCardView(product),
            _CategoryListView(),

            _ProductList(),

//        new ButtonBar(
//
//          mainAxisSize: MainAxisSize.min, // this will take space as minimum as posible(to center)
//          children: <Widget>[
//            Container(
//color: Colors.teal,
//            child: new FlatButton(
//
//              child: new Text(
//                  'Cart',
//                style: TextStyle(
//                  fontSize: 20,
//                  fontWeight: FontWeight.bold,
//                  color: Colors.white,
//                ),
//              ),
//              onPressed: null,
//            ),
//            ),
//          ],
//        ),
          ],
        ),
          floatingActionButton:  FloatingActionButton.extended(
          icon: Icon(Icons.shopping_cart),
            label: Text('View Cart'),
          onPressed: () {  },
        )

      )
    );
  }
}

Widget _BusinessCardView(Value data){
  return Container(
    child:Padding(
      padding: EdgeInsets.all(10) ,
      child:  Column(
        children: <Widget>[
          Card(
            elevation: 2,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        data.businessImageUrl!="" ? data.businessImageUrl: 'assets/noimage.png',
                      ),
                    )

                ),

                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Text(
                      data.businessPrimaryName,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      data.businessType,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      data.businessIsPickup.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    ),
  );
}

Widget _CategoryListView() {
  List<String> litems = ["Cat1","Cat2","Cat3","Cat4","Cat5","Cat6","Cat7","Cat8","Cat9","Cat10","Cat11","Cat12","Cat12","Cat13","Cat14","Cat15","Cat16","Cat17","Cat18","Cat19","Cat20","Cat21","Cat22","Cat23"];
  return Container(
    height: 50.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: litems == null ? 0 : litems.length,
      itemBuilder: (BuildContext context, int index){

        return new Card(
          child: Center(
            child: new FlatButton(
              onPressed: (){
                print(litems[index]);
              },
              child: Text( litems[index]),
            ),
          ),
        );
      },
    ),
  );
}

class _ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<_ProductList> {
  final dbHelper = DatabaseHelper.instance;
  invoice _invoice = invoice('',0,'',0.00 ,'',0);
  List<Value> _product = List<Value>();
  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }


  void _populateNewsArticles() {

    Webservice().load(Value.all,'new').then((products) => {
      setState(() => {
        _product = products
      })
    });

  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        itemCount: _product == null ? 0 : _product.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () async {

             print(_product[index].sellingPrice);
            },
            child: new Card(
              child: Center(
                child: new FlatButton(
                  onPressed: (){
                    Save(_product[index]);
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Image.network(
                          _product[index].imageurl!= null ? _product[index].imageurl: 'https://image.freepik.com/free-vector/watercolor-background_87374-69.jpg',
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text( _product[index].primaryName),
                          Text( _product[index].barcode != null ? _product[index].barcode : "No Barcode"),
                          Text( _product[index].sellingPrice.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  void Save(Value data) async{
    var uuid = Uuid();
    print(data.sellingPrice);
    _invoice = new invoice(uuid.v1(), 3, '324324', (1 * data.sellingPrice), data.id, 1);
//    _invoice.Id=uuid.v1();
//    _invoice.TenantId= 3;
//    _invoice.CustomerId ='324324';
//    _invoice.ProductId =data.id;
//    _invoice.Quantity =1;
//    _invoice.NetAmount = (1 * data.sellingPrice);

             var result =  dbHelper.insert(_invoice);
              result.then((value) => print(value));


  }
}
