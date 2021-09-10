import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grisoftware_demo/utils/textStyles.dart';
import 'package:grisoftware_demo/views/intro_slider_view.dart';
import 'package:grisoftware_demo/widgets/button.dart';
import 'package:grisoftware_demo/widgets/image.dart';
import 'package:grisoftware_demo/widgets/title.dart';

class IntroFirstScreenModel extends StatelessWidget {
  const IntroFirstScreenModel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: TitleImage()),
          Flexible(child: ImageWidget()),
          Flexible(
            child: TitleWidget(
              title: 'More than just shorter links',
              textStyle: titleTextStyle,
            ),
          ),
          Flexible(
            child: TitleWidget(
              title:
                  "Build your brand's recognition and get detailed insights on how your links are performing",
              textStyle: subTitleTextStyle,
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {
                Get.to(IntroSliderView());
              },
              child: CustomButton(
                text: 'Start',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
