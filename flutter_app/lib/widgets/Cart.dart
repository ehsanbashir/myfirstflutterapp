import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/Product.dart';
import 'package:flutterapp/models/invoice.dart';

import '../database_helper.dart';

class Cart extends StatelessWidget {
  final Value product;

  Cart({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

        title: "App Title",
        home:  Scaffold(
            appBar: AppBar(
              title: Text(product.businessPrimaryName),
            ),
            body: Column(
              children: <Widget>[
                _BusinessCardView(product),
                _ProductList(),
              ],
            ),
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

class _ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<_ProductList> {
  final dbHelper = DatabaseHelper.instance;

  List<invoice> _cartproduct;
  Future <void > getData() async{
    print('getData');
    final results = await dbHelper.queryAllRows();
    print('results $results');


    setState(() {
      _cartproduct = results
          .map<invoice>((json) => invoice.fromJson(json));
    });

    print('_cartproduct $_cartproduct[0].ProductName');
  }
  @override
  void initState() {
    super.initState();
      updateListView();
    }
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        itemCount: _cartproduct == null ? 0 : _cartproduct.length,

        itemBuilder: (BuildContext context, int index){

          return GestureDetector(
            onTap: () async {

//              print(_cartproduct[index].sellingPrice);
            },
            child: new Card(
              child: Center(
                child: new FlatButton(
                  onPressed: (){
//                    Save(_cartproduct[index]);
                  },
                  child: Row(
                    children: <Widget>[
//                      SizedBox(
//                        height: 100.0,
//                        width: 100.0,
//                        child: Image.network(
//                          _cartproduct[index].ProductName!= null ? _product[index].imageurl: 'https://image.freepik.com/free-vector/watercolor-background_87374-69.jpg',
//                        ),
//                      ),
                      Column(
                        children: <Widget>[
                          Text( _cartproduct[index].ProductName),
                          Text(_cartproduct[index].ProductBarcode),
                          Text(_cartproduct[index].NetAmount.toString()),
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

  void updateListView() {
      Future<List<invoice>> InvoiceListFuture = dbHelper.getInvcoieList();
      InvoiceListFuture.then((result) {
        setState(() {
          this._cartproduct = result;
        });
      });
  }
}