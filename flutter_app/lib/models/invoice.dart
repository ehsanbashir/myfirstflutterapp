
import 'dart:ffi';

class invoice {
  String _Id;
  int _TenantId;
  String _CustomerId;
  String _CustomerName;
  String _CustomerCode;
  String _ProductId;
  String _ProductName;
  String _ProductBarcode;
  int _Quantity;
  double _NetAmount;

  invoice(this._Id, this._TenantId, this._CustomerId, this._NetAmount, this._ProductId, this._Quantity, this._CustomerCode, this._CustomerName, this._ProductBarcode, this._ProductName);

   Map<String, dynamic> toMap(){
     var map = Map<String, dynamic>();
     map['Id'] = _Id;
     map['TenantId'] = _TenantId;
     map['CustomerId'] = _CustomerId;
     map['CustomerName'] = _CustomerName;
     map['CustomerCode'] = _CustomerCode;
     map['ProductId'] = _ProductId;
     map['ProductName'] = _ProductName;
     map['ProductBarcode'] = _ProductBarcode;
     map['Quantity'] = _Quantity;
     map['NetAmount']= _NetAmount;
     return map;
   }


   invoice.fromMapObject(Map<String, dynamic> map){
     this._Id = map['Id'];
     this._TenantId = map['TenantId'];
     this._CustomerId = map['CustomerId'];
     this._CustomerName =map['CustomerName'];
      this._CustomerCode= map['CustomerCode'];
     this._ProductId = map['ProductId'];
     this._ProductName = map['ProductName'];
     this._ProductBarcode = map['ProductBarcode'];
     this._Quantity = map['Quantity'];
     this._NetAmount = map['NetAmount'];
   }
   String get Id => _Id;

   set Id(String value) {
     _Id = value;
   }

   int get TenantId => _TenantId;

   set TenantId(int value) {
     _TenantId = value;
   }

   String get CustomerId => _CustomerId;

   set CustomerId(String value) {
     _CustomerId = value;
   }
  String get CustomerName => _CustomerName;

  set CustomerName(String value) {
    _CustomerName = value;
  }
   String get ProductId => _ProductId;

   set ProductId(String value) {
     _ProductId = value;
   }

   int get Quantity => _Quantity;

   set Quantity(int value) {
     _Quantity = value;
   }

   double get NetAmount => _NetAmount;

   set NetAmount(double value) {
     _NetAmount = value;
   }

  String get CustomerCode => _CustomerCode;

  set CustomerCode(String value) {
    _CustomerCode = value;
  }

  String get ProductName => _ProductName;

  set ProductName(String value) {
    _ProductName = value;
  }

  String get ProductBarcode => _ProductBarcode;

  set ProductBarcode(String value) {
    _ProductBarcode = value;
  }


  invoice.fromJson(Map<String, dynamic> map) {

      Id: map['Id'];
      TenantId: map['TenantId'];
      CustomerId: map['CustomerId'];
      CustomerName: map['CustomerName'];
      CustomerCode: map['CustomerCode'];
      ProductId: map['ProductId'];
      ProductName: map['ProductName'];
      ProductBarcode: map['ProductBarcode'];
      Quantity: map['Quantity'];
      NetAmount: map['NetAmount'];

  }
}