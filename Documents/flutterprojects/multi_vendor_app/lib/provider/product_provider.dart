import 'package:flutter/material.dart';
// purpose :this class will be used to manage and notify listners about the change
class  ProductProvider extends ChangeNotifier {
/// this map will store the product rel;ated information
Map<String, dynamic> productData = {};

// this method will be use to update product relate fields

getFormData({
  String? productName,
double? productPrice,
 int? quantity, 
 String? category,
 String? description ,
 DateTime ? scheduleDate,
 }){
  // check if product name is not null
   // purpose: ensure that only non null values where added
   if(productName!=null){
    productData['productName'] = productName;
   }
   if(productPrice!=null){
        productData['productPrice'] = productPrice;
   }
   if(quantity!=null){
        productData['quantity'] = quantity;
   }
   if(category!=null){
        productData['category'] = category;
   }
    if(description!=null){
        productData['description'] = description;
   }
   if(scheduleDate!=null){
        productData['scheduleDate'] = scheduleDate;
   }
}

}