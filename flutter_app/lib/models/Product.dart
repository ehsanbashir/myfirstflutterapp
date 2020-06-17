import 'dart:convert';
import 'dart:ffi';

import 'package:flutterapp/services/webservice.dart';

//class Product {
//
////  static Resource<List<Product>> get all {
////
////    return Resource(
////        url: 'https://igniteconnect-dev.search.windows.net/indexes/products-index/docs?api-version=2019-05-06&search=new&api-key=5F6FD9C93D5876805041BB569DA94495',
////        parse: (response) {
////          final result = json.decode(response.body);
////          print(result);
////          Iterable list = result['value'];
////          return list.map((model) => Product.fromJson(model)).toList();
////        }
////    );
////
////  }
//
////  String odataContext;
////  List<Value> value;
//
////  Product({this.odataContext, this.value});
//
////  Product.fromJson(Map<String, dynamic> json) {
////    odataContext = json['@odata.context'];
////    if (json['value'] != null) {
////      value = new List<Value>();
////      json['value'].forEach((v) {
////        value.add(new Value.fromJson(v));
////      });
////    }
////  }
//
////  Map<String, dynamic> toJson() {
////    final Map<String, dynamic> data = new Map<String, dynamic>();
////    data['@odata.context'] = this.odataContext;
////    if (this.value != null) {
////      data['value'] = this.value.map((v) => v.toJson()).toList();
////    }
////    return data;
////  }
//}

class Value {
  static Resource<List<Value>> get all {

    return Resource(
        url: 'https://igniteconnect-dev.search.windows.net/indexes/products-index/docs?api-version=2019-05-06&search=*&api-key=5F6FD9C93D5876805041BB569DA94495',
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['value'];
          return list.map((model) => Value.fromJson(model)).toList();
        }
    );

  }

  double searchScore;
  String id;
  String lastModificationTime;
  int tenantId;
  String primaryName;
  String altName;
  String barcode;
  String description;
  String tags;
  double purchasePrice;
  double sellingPrice;
  double taxablePrice;
  String refId;
  String businessId;
  bool isTaxable;
  String uOM;
  bool deleted;
  String status;
  PolygonJson polygonJson;
  String tenantName;
  String businessPrimaryName;
  String businessAltName;
  String businessImageUrl;
  double baseCostPrice;
  String baseCurrency;
  double baseDiscountedMPPrice;
  double baseDisountedSFPrice;
  double baseMpSellingPrice;
  double baseSfSellingPrice;
  double conversionRate;
  double discountedMPPrice;
  double disountedSFPrice;
  double height;
  bool isDiscounted;
  double length;
  double mpSellingPrice;
  String productCurrency;
  double sfSellingPrice;
  double shippingRate;
  double volume;
  double weight;
  double width;
  String businessType;
  String businessTypeAr;
  String businessAddress;
  String businessLatitude;
  String businessLongitude;
  bool businessIsTaxable;
  bool businessIsDelivery;
  bool businessIsPickup;
  String businessClassification;
  String businessPresence;
  String tinNo;
  String registrationNo;
  bool enableShipping;
  bool enablePickup;
  bool enableSelfshipping;
  bool enableCashDelivery;
  bool enableCardDelivery;
  bool enableCashPickup;
  bool enableCardPickup;
  bool enableCardOnline;
  bool enableTransferOnline;
  String defaultCountry;
  String defaultCity;
  String shippingOriginAddress;
  String defaultCurrency;
  int payoutCycleDays;
  int defaultRefundDays;
  int defaultPickupTime;
  int defaultDeliveryTime;
  bool enableOnlineStore;
  bool isApproved;
  bool isVerified;
  bool isClaimed;
  String bannerUrl;
  String defaultDomainName;
  String customDomainName;
  String primaryColor;
  String secondaryColor;
  double withdrawalLimit;
  double baseWithdrawalLimit;
  bool acceptOrdersWhenclosed;
  String genderRestriction;
  bool isFreeShipping;
  bool sellProduct;
  bool sellService;
  bool sellFood;
  int workingHours;
  String registerId;
  String registerStatus;
  String locationId;
  int userId;
  bool isReviewed;
  String imageurl;
//  String businessImageUrl;
  List<Categories> categories;
  List<ShippingZones> shippingZones;

  Value(
      {this.searchScore,
        this.id,
        this.lastModificationTime,
        this.tenantId,
        this.primaryName,
        this.altName,
        this.barcode,
        this.description,
        this.tags,
        this.purchasePrice,
        this.sellingPrice,
        this.taxablePrice,
        this.refId,
        this.businessId,
        this.isTaxable,
        this.uOM,
        this.deleted,
        this.status,
        this.polygonJson,
        this.tenantName,
        this.businessPrimaryName,
        this.businessAltName,
        this.businessImageUrl,
        this.baseCostPrice,
        this.baseCurrency,
        this.baseDiscountedMPPrice,
        this.baseDisountedSFPrice,
        this.baseMpSellingPrice,
        this.baseSfSellingPrice,
        this.conversionRate,
        this.discountedMPPrice,
        this.disountedSFPrice,
        this.height,
        this.isDiscounted,
        this.length,
        this.mpSellingPrice,
        this.productCurrency,
        this.sfSellingPrice,
        this.shippingRate,
        this.volume,
        this.weight,
        this.width,
        this.businessType,
        this.businessTypeAr,
        this.businessAddress,
        this.businessLatitude,
        this.businessLongitude,
        this.businessIsTaxable,
        this.businessIsDelivery,
        this.businessIsPickup,
        this.businessClassification,
        this.businessPresence,
        this.tinNo,
        this.registrationNo,
        this.enableShipping,
        this.enablePickup,
        this.enableSelfshipping,
        this.enableCashDelivery,
        this.enableCardDelivery,
        this.enableCashPickup,
        this.enableCardPickup,
        this.enableCardOnline,
        this.enableTransferOnline,
        this.defaultCountry,
        this.defaultCity,
        this.shippingOriginAddress,
        this.defaultCurrency,
        this.payoutCycleDays,
        this.defaultRefundDays,
        this.defaultPickupTime,
        this.defaultDeliveryTime,
        this.enableOnlineStore,
        this.isApproved,
        this.isVerified,
        this.isClaimed,
        this.bannerUrl,
        this.defaultDomainName,
        this.customDomainName,
        this.primaryColor,
        this.secondaryColor,
        this.withdrawalLimit,
        this.baseWithdrawalLimit,
        this.acceptOrdersWhenclosed,
        this.genderRestriction,
        this.isFreeShipping,
        this.sellProduct,
        this.sellService,
        this.sellFood,
        this.workingHours,
        this.registerId,
        this.registerStatus,
        this.locationId,
        this.userId,
        this.isReviewed,
        this.imageurl,
//        this.businessImageUrl,
        this.categories,
        this.shippingZones});

  Value.fromJson(Map<String, dynamic> json) {
    searchScore = json['@search.score'];
    id = json['Id'];
    lastModificationTime = json['LastModificationTime'];
    tenantId = json['TenantId'];
    primaryName = json['primary_name'];
    altName = json['alt_name'];
    barcode = json['barcode'];
    description = json['description'];
    tags = json['tags'];
    purchasePrice = json['purchase_price'];
    sellingPrice = json['selling_price'];
    taxablePrice = json['taxable_price'];
    refId = json['ref_id'];
    businessId = json['business_id'];
    isTaxable = json['is_taxable'];
    uOM = json['UOM'];
    deleted = json['Deleted'];
    status = json['status'];
    polygonJson = json['polygon_json'] != null
        ? new PolygonJson.fromJson(json['polygon_json'])
        : null;
    tenantName = json['tenant_name'];
    businessPrimaryName = json['business_primary_name'];
    businessAltName = json['business_alt_name'];
    businessImageUrl = json['business_image_url'];
    baseCostPrice = json['base_cost_price'];
    baseCurrency = json['base_currency'];
    baseDiscountedMPPrice = json['base_discounted_MP_price'];
    baseDisountedSFPrice = json['base_disounted_SF_price'];
    baseMpSellingPrice = json['base_mp_selling_price'];
    baseSfSellingPrice = json['base_sf_selling_price'];
    conversionRate = json['conversion_rate'];
    discountedMPPrice = json['discounted_MP_price'];
    disountedSFPrice = json['disounted_SF_price'];
    height = json['height'];
    isDiscounted = json['is_discounted'];
    length = json['length'];
    mpSellingPrice = json['mp_selling_price'];
    productCurrency = json['product_currency'];
    sfSellingPrice = json['sf_selling_price'];
    shippingRate = json['shipping_rate'];
    volume = json['volume'];
    weight = json['weight'];
    width = json['width'];
    businessType = json['business_type'];
    businessTypeAr = json['business_type_ar'];
    businessAddress = json['business_address'];
    businessLatitude = json['business_latitude'];
    businessLongitude = json['business_longitude'];
    businessIsTaxable = json['business_is_taxable'];
    businessIsDelivery = json['business_is_delivery'];
    businessIsPickup = json['business_is_pickup'];
    businessClassification = json['business_classification'];
    businessPresence = json['business_presence'];
    tinNo = json['tin_no'];
    registrationNo = json['registration_no'];
    enableShipping = json['enable_shipping'];
    enablePickup = json['enable_pickup'];
    enableSelfshipping = json['enable_selfshipping'];
    enableCashDelivery = json['enable_cash_delivery'];
    enableCardDelivery = json['enable_card_delivery'];
    enableCashPickup = json['enable_cash_pickup'];
    enableCardPickup = json['enable_card_pickup'];
    enableCardOnline = json['enable_card_online'];
    enableTransferOnline = json['enable_transfer_online'];
    defaultCountry = json['default_country'];
    defaultCity = json['default_city'];
    shippingOriginAddress = json['shipping_origin_address'];
    defaultCurrency = json['default_currency'];
    payoutCycleDays = json['payout_cycle_days'];
    defaultRefundDays = json['default_refund_days'];
    defaultPickupTime = json['default_pickup_time'];
    defaultDeliveryTime = json['default_delivery_time'];
    enableOnlineStore = json['enable_online_store'];
    isApproved = json['is_approved'];
    isVerified = json['is_verified'];
    isClaimed = json['is_claimed'];
    bannerUrl = json['banner_url'];
    defaultDomainName = json['default_domain_name'];
    customDomainName = json['custom_domain_name'];
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    withdrawalLimit = json['withdrawal_limit'];
    baseWithdrawalLimit = json['base_withdrawal_limit'];
    acceptOrdersWhenclosed = json['accept_orders_whenclosed'];
    genderRestriction = json['gender_restriction'];
    isFreeShipping = json['is_free_shipping'];
    sellProduct = json['sell_product'];
    sellService = json['sell_service'];
    sellFood = json['sell_food'];
    workingHours = json['working_hours'];
    registerId = json['registerId'];
    registerStatus = json['register_status'];
    locationId = json['locationId'];
    userId = json['userId'];
    isReviewed = json['is_reviewed'];
    imageurl = json['imageurl'];
//    businessImageUrl = json['businessImageUrl'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['shipping_zones'] != null) {
      shippingZones = new List<ShippingZones>();
      json['shipping_zones'].forEach((v) {
        shippingZones.add(new ShippingZones.fromJson(v));
      });
    }
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['@search.score'] = this.searchScore;
//    data['Id'] = this.id;
//    data['LastModificationTime'] = this.lastModificationTime;
//    data['TenantId'] = this.tenantId;
//    data['primary_name'] = this.primaryName;
//    data['alt_name'] = this.altName;
//    data['barcode'] = this.barcode;
//    data['description'] = this.description;
//    data['tags'] = this.tags;
//    data['purchase_price'] = this.purchasePrice;
//    data['selling_price'] = this.sellingPrice;
//    data['taxable_price'] = this.taxablePrice;
//    data['ref_id'] = this.refId;
//    data['business_id'] = this.businessId;
//    data['is_taxable'] = this.isTaxable;
//    data['UOM'] = this.uOM;
//    data['Deleted'] = this.deleted;
//    data['status'] = this.status;
//    if (this.polygonJson != null) {
//      data['polygon_json'] = this.polygonJson.toJson();
//    }
//    data['tenant_name'] = this.tenantName;
//    data['business_primary_name'] = this.businessPrimaryName;
//    data['business_alt_name'] = this.businessAltName;
////    data['business_image_url'] = this.businessImageUrl;
//    data['base_cost_price'] = this.baseCostPrice;
//    data['base_currency'] = this.baseCurrency;
//    data['base_discounted_MP_price'] = this.baseDiscountedMPPrice;
//    data['base_disounted_SF_price'] = this.baseDisountedSFPrice;
//    data['base_mp_selling_price'] = this.baseMpSellingPrice;
//    data['base_sf_selling_price'] = this.baseSfSellingPrice;
//    data['conversion_rate'] = this.conversionRate;
//    data['discounted_MP_price'] = this.discountedMPPrice;
//    data['disounted_SF_price'] = this.disountedSFPrice;
//    data['height'] = this.height;
//    data['is_discounted'] = this.isDiscounted;
//    data['length'] = this.length;
//    data['mp_selling_price'] = this.mpSellingPrice;
//    data['product_currency'] = this.productCurrency;
//    data['sf_selling_price'] = this.sfSellingPrice;
//    data['shipping_rate'] = this.shippingRate;
//    data['volume'] = this.volume;
//    data['weight'] = this.weight;
//    data['width'] = this.width;
//    data['business_type'] = this.businessType;
//    data['business_type_ar'] = this.businessTypeAr;
//    data['business_address'] = this.businessAddress;
//    data['business_latitude'] = this.businessLatitude;
//    data['business_longitude'] = this.businessLongitude;
//    data['business_is_taxable'] = this.businessIsTaxable;
//    data['business_is_delivery'] = this.businessIsDelivery;
//    data['business_is_pickup'] = this.businessIsPickup;
//    data['business_classification'] = this.businessClassification;
//    data['business_presence'] = this.businessPresence;
//    data['tin_no'] = this.tinNo;
//    data['registration_no'] = this.registrationNo;
//    data['enable_shipping'] = this.enableShipping;
//    data['enable_pickup'] = this.enablePickup;
//    data['enable_selfshipping'] = this.enableSelfshipping;
//    data['enable_cash_delivery'] = this.enableCashDelivery;
//    data['enable_card_delivery'] = this.enableCardDelivery;
//    data['enable_cash_pickup'] = this.enableCashPickup;
//    data['enable_card_pickup'] = this.enableCardPickup;
//    data['enable_card_online'] = this.enableCardOnline;
//    data['enable_transfer_online'] = this.enableTransferOnline;
//    data['default_country'] = this.defaultCountry;
//    data['default_city'] = this.defaultCity;
//    data['shipping_origin_address'] = this.shippingOriginAddress;
//    data['default_currency'] = this.defaultCurrency;
//    data['payout_cycle_days'] = this.payoutCycleDays;
//    data['default_refund_days'] = this.defaultRefundDays;
//    data['default_pickup_time'] = this.defaultPickupTime;
//    data['default_delivery_time'] = this.defaultDeliveryTime;
//    data['enable_online_store'] = this.enableOnlineStore;
//    data['is_approved'] = this.isApproved;
//    data['is_verified'] = this.isVerified;
//    data['is_claimed'] = this.isClaimed;
//    data['banner_url'] = this.bannerUrl;
//    data['default_domain_name'] = this.defaultDomainName;
//    data['custom_domain_name'] = this.customDomainName;
//    data['primary_color'] = this.primaryColor;
//    data['secondary_color'] = this.secondaryColor;
//    data['withdrawal_limit'] = this.withdrawalLimit;
//    data['base_withdrawal_limit'] = this.baseWithdrawalLimit;
//    data['accept_orders_whenclosed'] = this.acceptOrdersWhenclosed;
//    data['gender_restriction'] = this.genderRestriction;
//    data['is_free_shipping'] = this.isFreeShipping;
//    data['sell_product'] = this.sellProduct;
//    data['sell_service'] = this.sellService;
//    data['sell_food'] = this.sellFood;
//    data['working_hours'] = this.workingHours;
//    data['registerId'] = this.registerId;
//    data['register_status'] = this.registerStatus;
//    data['locationId'] = this.locationId;
//    data['userId'] = this.userId;
//    data['is_reviewed'] = this.isReviewed;
//    data['imageurl'] = this.imageurl;
////    data['businessImageUrl'] = this.businessImageUrl;
//    if (this.categories != null) {
//      data['categories'] = this.categories.map((v) => v.toJson()).toList();
//    }
//    if (this.shippingZones != null) {
//      data['shipping_zones'] =
//          this.shippingZones.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
}

class PolygonJson {
  String type;
  List<int> coordinates;
  Crs crs;

  PolygonJson({this.type, this.coordinates, this.crs});

  PolygonJson.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
    crs = json['crs'] != null ? new Crs.fromJson(json['crs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    if (this.crs != null) {
      data['crs'] = this.crs.toJson();
    }
    return data;
  }
}

class Crs {
  String type;
  Properties properties;

  Crs({this.type, this.properties});

  Crs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    return data;
  }
}

class Properties {
  String name;

  Properties({this.name});

  Properties.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Categories {
  String id;
  String primaryName;
  String altName;

  Categories({this.id, this.primaryName, this.altName});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryName = json['primary_name'];
    altName = json['alt_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['primary_name'] = this.primaryName;
    data['alt_name'] = this.altName;
    return data;
  }
}

class ShippingZones {
  String id;
  String zonename;
  String scope;
  String allowedCities;
  String allowedCountries;
  String status;
  double fixedRate;
  double baseFixedRate;

  ShippingZones(
      {this.id,
        this.zonename,
        this.scope,
        this.allowedCities,
        this.allowedCountries,
        this.status,
        this.fixedRate,
        this.baseFixedRate});

  ShippingZones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zonename = json['zonename'];
    scope = json['scope'];
    allowedCities = json['allowed_cities'];
    allowedCountries = json['allowed_countries'];
    status = json['status'];
    fixedRate = json['fixed_rate'];
    baseFixedRate = json['base_fixed_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['zonename'] = this.zonename;
    data['scope'] = this.scope;
    data['allowed_cities'] = this.allowedCities;
    data['allowed_countries'] = this.allowedCountries;
    data['status'] = this.status;
    data['fixed_rate'] = this.fixedRate;
    data['base_fixed_rate'] = this.baseFixedRate;
    return data;
  }
}

//class Product {
//  final String Id;
//  final int TenantId;
//  final String primary_name;
//  final String alt_name;
//  final String imageurl;
//  final String selling_price;
//  final String barcode;
//
//  Product({this.Id, this.TenantId, this.primary_name, this.alt_name, this.imageurl, this.selling_price, this.barcode});
//  factory Product.fromJson(dynamic product){
//    print(product);
//    return Product(
//        Id: product['Id'],
//        TenantId: product['TenantId'],
//        primary_name: product['primary_name'],
//        alt_name: product['alt_name'],
//        imageurl: product['imageurl'],
//        barcode: product['barcode']
//    );
//  }
//  static Resource<List<Product>> get all {
//
//    return Resource(
//        url: 'https://igniteconnect-dev.search.windows.net/indexes/products-index/docs?api-version=2019-05-06&search=new&api-key=5F6FD9C93D5876805041BB569DA94495',
//        parse: (response) {
//          final result = json.decode(response.body);
//          Iterable list = result['value'];
//          return list.map((model) => Product.fromJson(model)).toList();
//        }
//    );
//
//  }
//}