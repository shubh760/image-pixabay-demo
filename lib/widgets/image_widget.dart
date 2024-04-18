import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_showcase/ui/home/home_controller.dart';
import 'package:image_showcase/widgets/app_text.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, this.imageData});
  final imageData;
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return OpenContainer(
      closedElevation: 0.0,
      closedBuilder: (BuildContext context, void Function() action) {
        return Obx(() => Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      controller.images[imageData]['previewURL'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            controller.images[imageData]['tags'].toString(),
                            style: CustomTextStyle.textStyle(size: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              size: 20,
                            ),
                            Text(
                              controller.images[imageData]['likes'].toString(),
                              style: CustomTextStyle.textStyle(
                                size: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
      openBuilder:
          (BuildContext context, void Function({Object? returnValue}) action) {
        return OpenImage(imageData: imageData);
      },
    );
  }
}

class OpenImage extends StatelessWidget {
  const OpenImage({super.key, this.imageData});
  final imageData;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
              child:
                  Image.network(controller.images[imageData]['largeImageURL'])),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        controller.images[imageData]['userImageURL']),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      controller.images[imageData]["user"],
                      style: CustomTextStyle.textStyle(size: 16),
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        size: 30,
                      ),
                      Text(
                        controller.images[imageData]['likes'].toString(),
                        style: CustomTextStyle.textStyle(
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Tags: ",
                    style: CustomTextStyle.textStyle(
                      size: 15,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: controller.images[imageData]['tags'],
                    style: CustomTextStyle.textStyle(
                      size: 15,
                    )),
              ])),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Key Specs :",
                style: CustomTextStyle.textStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Height:",
                        style: CustomTextStyle.textStyle(),
                      ),
                      Text(
                        "Width:",
                        style: CustomTextStyle.textStyle(),
                      ),
                      Text(
                        "Views:",
                        style: CustomTextStyle.textStyle(),
                      ),
                      Text(
                        "Downloads:",
                        style: CustomTextStyle.textStyle(),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${controller.images[imageData]['imageHeight']}",
                        style: CustomTextStyle.textStyle(),
                      ),
                      Text(
                        "${controller.images[imageData]['imageWidth']}",
                        style: CustomTextStyle.textStyle(),
                      ),
                      Text(
                        "${controller.images[imageData]['views']}",
                        style: CustomTextStyle.textStyle(),
                      ),
                      Text(
                        "${controller.images[imageData]['downloads']}",
                        style: CustomTextStyle.textStyle(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ])),
      ],
    ));
  }
}
