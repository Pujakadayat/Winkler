import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ProductDetailScreen extends StatefulWidget {
final dynamic productData;

  const ProductDetailScreen({super.key, this.productData});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _imageIndex =0;
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          widget.productData['productName'],
        style:TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ) ,
        ),
      ),

      body: SingleChildScrollView(
        
        child: Column(
          children: [
            Stack(
              children: [
            Container(
              height: 300,
              width: double.infinity,
              child: PhotoView(
                imageProvider: (widget.productData['imageUrl'][_imageIndex])),
            ),
            Positioned(
              bottom: 0,
              child:Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.productData['imageUrl'].length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  setState(() {
                   _imageIndex= index; 
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  height: 60,
                  width: 60,
                  child: Image.network(widget.productData['imageUrl'][index]),
                ),
              );
            }
                ),
                ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '\$' + ' ' +widget.productData['productPrice'].toStringAsFixed(2),
              style:TextStyle(
                fontSize: 22,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade300,
              ) ,
              ),
            ),
             Text(widget.productData['productName'],
            style:TextStyle(
              fontSize: 22,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ) ,
            ),
            ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Text('Product Description',style: TextStyle(color: Colors.red.shade300),),
            Text('View more',style: TextStyle(color: Colors.red.shade300),),
           ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.productData[
                    'description'],
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black26
                          
                  ),
                  textAlign: TextAlign.center,
                  ),
                ),
                ExpansionTile(
                  title: Text('Available Size',),
                  children: [
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:widget.productData['sizeList'].length ,
                        itemBuilder: (context, index){
return Padding(
  padding: const EdgeInsets.all(8.0),
  child: OutlinedButton(onPressed: (){
    setState(() {
      _selectedSize = widget.productData['sizedList'][index];
    });
    print(_selectedSize);
  },
   child:Text(widget.productData['sizeList'][index],
   ),
   ),
);
                        }
                      ),
                      )
                  ],
                )
              ],
              ),
          ],
        ),
      ),
      bottomSheet:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color:Colors.red.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(CupertinoIcons.cart,
                color: Colors.white10,
                size: 26,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Add To Cart',style: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 3),),
              ),
            ],
          ),
        ),
      )
    );
  }
}