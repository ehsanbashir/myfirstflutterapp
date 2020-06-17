
import 'dart:ffi';

class invoice {
  String _Id;
  int _TenantId;
  String _CustomerId;
  String _ProductId;
  int _Quantity;
  double _NetAmount;

  invoice(this._Id, this._TenantId, this._CustomerId, this._NetAmount, this._ProductId, this._Quantity);

   Map<String, dynamic> toMap(){
     var map = Map<String, dynamic>();
     map['Id'] = _Id;
     map['TenantId'] = _TenantId;
     map['CustomerId'] = _CustomerId;
     map['ProductId'] = _ProductId;
     map['Quantity'] = _Quantity;
     map['NetAmount']= _NetAmount;
     return map;
   }


   invoice.fromMapObject(Map<String, dynamic> map){
     this._Id = map['Id'];
     this._TenantId = map['TenantId'];
     this._CustomerId = map['CustomerId'];
     this._ProductId = map['ProductId'];
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
}