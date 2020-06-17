import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/Product.dart';

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
//                _ProductList(),

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