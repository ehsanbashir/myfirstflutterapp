import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/Business.dart';
import 'package:flutterapp/services/webservice.dart';
import 'package:shimmer/shimmer.dart';


class BusinessedList extends StatefulWidget {

  @override
  createState() => BusinessListState();
}
class BusinessListState extends State<BusinessedList>{
  bool isFullScreenDialog = true;
  List<Business> _business = List<Business>();
  @override
  void initState() {
    super.initState();
}

  Widget _buildItemsForListView(BuildContext context, int index) {
    if(_business[index].image_url == null || _business[index].image_url=="")
      _business[index].image_url = 'https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png';
    return
    GestureDetector(
        onTap: () {
          print(_business[index].primary_name);
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
                            'https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png',
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
                            _business[index].primary_name!= null? _business[index].primary_name: "No Data",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          new Text(
                            _business[index].alt_name,
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
        body: BusinessWidget()
//        _business == null ? _loadingImageAnimation(context): _imageLoaded(context)
//        ListView.builder(
//          itemCount: _business.length,
//          itemBuilder: _buildItemsForListView,
//        )
    );
  }

}

class BusinessWidget extends StatelessWidget {
  Future<List<Business>> _getBusinesses() async{
    return await Webservice().load(Business.all,'*');
//        .then((newsArticles) => {
//      setState(() => {
//        _business = newsArticles
//      })
//    });

  }
  @override
  Widget build(context) {
    return FutureBuilder<List<Business>>(
        future: _getBusinesses(),
        builder: (context, AsyncSnapshot<List<Business>> snapshot) {
          if (snapshot.hasData) {
            return _imageLoaded(context,snapshot.data);
          } else {
            return _loadingImageAnimation(context,4);
          }
        }
    );
  }

  Widget _imageLoaded(BuildContext context,List<Business> businesses) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: mediaQueryData.size.height / 1300,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      primary: false,
      children: List.generate(
        /// Get data in flashSaleItem.dart (ListItem folder)
        businesses.length,
            (index) => itemGrid(businesses[index]),
      ),
    );
  }

  Widget _loadingImageAnimation(BuildContext context,int businessLength) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: mediaQueryData.size.height / 1300,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      primary: false,
      children: List.generate(
        /// Get data in flashSaleItem.dart (ListItem folder)
        businessLength,
            (index) => loadingItemGrid(),
      ),
    );
  }

}
class loadingItemGrid extends StatelessWidget {
  @override
  final color = Colors.black38;
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    spreadRadius: 0.2,
                    blurRadius: 0.5)
              ]),
              child: Shimmer.fromColors(
                baseColor: color,
                highlightColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 140.0,
                      width: mediaQueryData.size.width / 2.1,
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Container(
                        height: 15.0,
                        width: mediaQueryData.size.width / 2.6,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 8.0),
                      child: Container(
                        height: 10.0,
                        width: mediaQueryData.size.width / 4.1,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Container(
                        height: 8.0,
                        width: mediaQueryData.size.width / 6.0,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 13.0,
                            color: Colors.black38,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              height: 6.0,
                              width: mediaQueryData.size.width / 5.5,
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, left: 10.0, bottom: 15.0),
                      child: Container(
                        height: 7.0,
                        width: mediaQueryData.size.width / 2.5,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class itemGrid extends StatelessWidget {
  /// Declare FlashSaleItem.dart get a data from FlashSaleItem.dart
  Business itemSale;
  itemGrid(this.itemSale);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
//                Navigator.of(context).push(PageRouteBuilder(
//                    pageBuilder: (_, __, ___) => new flashSaleDetail(itemSale),
//                    transitionDuration: Duration(milliseconds: 950),
//                    transitionsBuilder:
//                        (_, Animation<double> animation, __, Widget child) {
//                      return Opacity(
//                        opacity: animation.value,
//                        child: child,
//                      );
//                    })
//                );
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      spreadRadius: 0.2,
                      blurRadius: 0.5)
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Animation image header to flashSaleDetail.dart
                    Hero(
                      tag: "hero-flashsale-${itemSale.id}",
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) {
                                  return new Material(
                                    color: Colors.black54,
                                    child: Container(
                                      padding: EdgeInsets.all(30.0),
                                      child: InkWell(
                                        child: Hero(
                                            tag:
                                            "hero-flashsale-${itemSale.id}",
                                            child: Image.network(
                                              itemSale.image_url,
                                              width: 300.0,
                                              height: 300.0,
                                              alignment: Alignment.center,
                                              fit: BoxFit.contain,
                                            )),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                                transitionDuration:
                                Duration(milliseconds: 500)));
                          },
                          child: SizedBox(
                            child: Image.network(
                              itemSale.image_url,
                              fit: BoxFit.cover,
                              height: 140.0,
                              width: mediaQueryData.size.width / 2.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 8.0, right: 3.0, top: 15.0),
                      child: Container(
                        width: mediaQueryData.size.width / 2.7,
                        child: Text(
                          itemSale.primary_name,
                          style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans"),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Text(itemSale.alt_name,
                          style: TextStyle(
                              fontSize: 10.5,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Sans")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Text(itemSale.TenantId,
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF7F7FD5),
                              fontWeight: FontWeight.w800,
                              fontFamily: "Sans")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_half,
                            size: 11.0,
                            color: Colors.yellow,
                          ),
                          Text(
                            itemSale.TenantId,
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Sans",
                                color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 11.0,
                            color: Colors.black38,
                          ),
                          Text(
                            itemSale.primary_name,
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Sans",
                                color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Text(
                        itemSale.primary_name,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Sans",
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, left: 10.0, bottom: 15.0),
                      child: Container(
                        height: 5.0,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFA500),
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
