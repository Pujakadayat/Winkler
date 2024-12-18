// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:multi_vendor_app/provider/product_provider.dart';
// import 'package:multi_vendor_app/vendor/views/screens/main_vendor_screen.dart';
// import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/attributes_tab_screen.dart';
// import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/general_screen.dart';
// import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/images_tab_screen.dart';
// import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/shipping_screen.dart';
// import 'package:uuid/uuid.dart';


// class UploadScreen extends StatelessWidget {
// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
//   get Provider => null;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//        final ProductProvider _productProvider = 
//    Provider.of<ProductProvider>(context);
//     return DefaultTabController(
//       length:4,
//       child: Form(
//         key: _formKey,
//         child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.grey.shade300,
//           elevation: 0,
//           bottom: TabBar(
//         tabs: [
//           Tab(child: Text('General'),),
//                   Tab(child: Text('Shipping'),),
//                           Tab(child: Text('Attributes'),),
//                                   Tab(child: Text('Images'),),
                                  
//         ]),
//         ),
//         body: TabBarView(children: [
//           GeneralScreen(),
//         ShippingScreen(),
//         AttributesTabScreen(),
//         ImagesTabScreen(),
//         ]),
//         bottomSheet: Padding(padding: const EdgeInsets.all(8),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
//           onPressed: ()async{
//             EasyLoading.show(status: 'Uploading Product! Please Wait...');
//             if(_formKey.currentState!.validate()){
// final productid = Uuid().v4();
// await _firestore.collection('products').doc(productid).set({
//   'productid':productid,
//   'productName':_productProvider.productData['productName'],
//   'productPrice':_productProvider.productData['productPrice'],
// 'quantity':_productProvider.productData['quantity'],
// 'category':_productProvider.productData['category'],
// 'description':_productProvider.productData['description'],
//  'imageUrlList':_productProvider.productData['imageUrlList'],
//   'scheduleDate':_productProvider.productData['scheduleDate'],
//    'chargeShipping':_productProvider.productData['chargeShipping'],
//     'shippingCharge':_productProvider.productData['shippingCharge'],
//      'brandName':_productProvider.productData['brandName'],
//           'sizeList':_productProvider.productData['sizeList'],
// }).whenComplete((){
//   _productProvider.clearData();
//   _formKey.currentState!.reset();
// EasyLoading.dismiss();
//   Navigator.push(context,
// MaterialPageRoute(builder: (context){
// return MainVendorScreen();
// })
//    );
// });
//             }
      
//         }, child: Text('Save')),),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_vendor_app/provider/product_provider.dart';
import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/attributes_tab_screen.dart';
import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/general_screen.dart';
import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/images_tab_screen.dart';
import 'package:multi_vendor_app/vendor/views/screens/upload_tab_screens/shipping_screen.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the ProductProvider instance
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('General')),
              Tab(child: Text('Shipping')),
              Tab(child: Text('Attributes')),
              Tab(child: Text('Images')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GeneralScreen(),
           ShippingScreen(),
             AttributesTabScreen(),
            ImagesTabScreen(),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              // Print product data
              print('Product Name: ${_productProvider.productData['productName']}');
              print('Quantity: ${_productProvider.productData['quantity']}');
              print('Price: ${_productProvider.productData['productPrice']}');
              print('Category: ${_productProvider.productData['category']}');
              print('Description: ${_productProvider.productData['description']}');
            },
            child: const Text('Save'),
          ),
        ),
      ),
    );
  }
}