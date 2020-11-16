import 'package:flutter/material.dart';
class ImagePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: false,
      maxScale: 4,
      minScale: 1,
      child: Hero(
        tag: "ImagePreview",
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.33,
          width: double.infinity,
          child: Image(image: AssetImage("image/etroplus.jpeg"),),
        ),
      ),
    );
  }
}
