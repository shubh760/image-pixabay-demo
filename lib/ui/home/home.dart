import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_showcase/ui/home/home_controller.dart';
import 'package:image_showcase/widgets/app_text.dart';
import 'package:image_showcase/widgets/image_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 100.0;
    final axisCount = (screenWidth / itemWidth).floor();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.network(
                    'https://imgs.search.brave.com/CkEl_-TbYZKeKiGIb5su0J8xyAFTZ-fCJjmHlPZljq8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy84/LzgxL1BpeGFiYXkt/bG9nby5zdmc.svg',
                    height: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "search",
                      style: CustomTextStyle.textStyle(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => MasonryGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: axisCount - 1,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: controller.images.length,
                  itemBuilder: (context, index) {
                    return ImageWidget(
                      imageData: index,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
