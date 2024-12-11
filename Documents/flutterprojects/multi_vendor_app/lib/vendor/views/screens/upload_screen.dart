import 'package:flutter/material.dart';
import 'package:multi_vendor_app/provider/product_provider.dart';
import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/attributes_tab_screen.dart';
import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/general_screen.dart';
import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/images_tab_screen.dart';
import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/shipping_screen.dart';


class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  
  get Provider => null;

  @override
  Widget build(BuildContext context) {
       final ProductProvider _productProvider = 
   Provider.of<ProductProvider>(context);
    return DefaultTabController(
      length:4,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        bottom: TabBar(
      tabs: [
        Tab(child: Text('General'),),
                Tab(child: Text('Shipping'),),
                        Tab(child: Text('Attributes'),),
                                Tab(child: Text('Images'),),
                                
      ]),
      ),
      body: TabBarView(children: [
        GeneralScreen(),
ShippingScreen(),
AttributesTabScreen(),
ImagesTabScreen(),
      ]),
      bottomSheet: Padding(padding: const EdgeInsets.all(8),
      child: ElevatedButton(onPressed: (){
print(_productProvider.productData['productName']);
print(_productProvider.productData['quantity']);
print(_productProvider.productData['productPrice']);
print(_productProvider.productData['category']);
print(_productProvider.productData['description']);
      }, child: Text('Save')),),
      ),
    );
  }
}