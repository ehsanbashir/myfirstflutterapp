import 'dart:convert';

import 'package:flutterapp/services/webservice.dart';

class Business
{
   String id;
   String TenantId;
   String primary_name;
   String alt_name;
   String image_url;

  Business({this.id, this.TenantId,  this.primary_name, this.alt_name, this.image_url});
  factory Business.fromJson(dynamic business){
    return Business(
      id: business['id'],
      TenantId: business['TenantId'],
      primary_name: business['primary_name'],
      alt_name: business['alt_name'],
      image_url: business['image_url'],
    );
  }

  static Resource<List<Business>> get all {

    return Resource(
        url: 'https://igniteconnect-dev.search.windows.net/indexes/business-dev-index/docs?api-version=2019-05-06&search=*&api-key=5F6FD9C93D5876805041BB569DA94495',
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['value'];
          return list.map((model) => Business.fromJson(model)).toList();
        }
    );

  }
}

