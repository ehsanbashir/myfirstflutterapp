import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/Business.dart';
import 'package:flutterapp/services/webservice.dart';



class BusinessedList extends StatefulWidget {

  @override
  createState() => BusinessListState();
}
class BusinessListState extends State<BusinessedList>{
  List<Business> _business = List<Business>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }


  void _populateNewsArticles() {

    Webservice().load(Business.all,'*').then((newsArticles) => {
      setState(() => {
        _business = newsArticles
      })
    });

  }

  Widget _buildItemsForListView(BuildContext context, int index) {
    return _business.length >0 ? GestureDetector(
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
                            _business[index].image_url!= null? _business[index].image_url : 'https://image.freepik.com/free-vector/watercolor-background_87374-69.jpg'
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
    )
        : Center(
      child: CircularProgressIndicator(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
          itemCount: _business.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }

}