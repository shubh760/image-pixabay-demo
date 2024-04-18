import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_showcase/consts/api_const.dart';
import 'package:image_showcase/helpers/api_helper.dart';

class HomeController extends GetxController {
  RxList images = [].obs;

  @override
  void onInit() {
    getImages();
    // TODO: implement onInit
    super.onInit();
  }

  Future getImages() {
    return ApiHelper.get("$pixabayApi?key=$apikey").then((value) {
      // images.addAll(value['hits']);
      updateImageList(value['hits']);
      // images.refresh();
    });
  }

  updateImageList(List imagesList) {
    images.clear();
    images = RxList(imagesList);
    update();
  }

  double getImageAspectRatio(String imagekey) {
    Completer<Size> completer = Completer();
    Image image = Image.network(imagekey);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );

    double ratio = 0.0;
    completer.future.then((value) {
      ratio = value.width / value.height;
    });
    return ratio;
  }
}
