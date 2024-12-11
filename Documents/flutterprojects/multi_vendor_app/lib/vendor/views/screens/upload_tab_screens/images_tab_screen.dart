import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesTabScreen extends StatefulWidget {
  @override
  State<ImagesTabScreen> createState() => _ImagesTabScreenState();
}

class _ImagesTabScreenState extends State<ImagesTabScreen> {
  // const ImagesTabScreen({super.key}); yo line vaneko constructor ho used to pass data from one screen to another
final ImagePicker picker = ImagePicker();

List<File> _image = [];

chooseImage()async{
final PickedFile = await picker.pickImage(source: ImageSource.gallery);

if(PickedFile!=null){
  print('no image picked');
}else{
setState(() {
  _image.add(File(PickedFile!.path));
});
}
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Images Screen"),
    );
  }
}