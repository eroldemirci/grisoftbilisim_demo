import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grisoftware_demo/utils/textStyles.dart';
import 'package:grisoftware_demo/views/home_view.dart';
import 'package:grisoftware_demo/widgets/image.dart';
import 'package:grisoftware_demo/widgets/slider_card.dart';
import 'package:grisoftware_demo/widgets/title.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroSliderViewModel extends StatelessWidget {
  const IntroSliderViewModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> screens = [
      SliderCardWidget(
        title: "Brand Recognition",
        subTitle:
            "Boos your brand recognition with each click. Generic links don't mean a thing. Branded links help instil confidence in your content.",
      ),
      SliderCardWidget(
        title: "Detailed Records",
        subTitle:
            "Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.",
      ),
      SliderCardWidget(
        title: "Fully Customizable",
        subTitle:
            "Improve brand awareness and content discoverability through customizable links, supercharging audience engagement",
      ),
    ];

    final PageController controller = PageController(initialPage: 0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(child: TitleImage()),
        Container(
          height: size.width <= 500 ? size.height * 0.5 : size.height * 0.65,
          width: size.width,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: screens.length,
            controller: controller,
            itemBuilder: (context, index) {
              return screens[index];
            },
          ),
        ),
        Flexible(
          child: SmoothPageIndicator(
            controller: controller,
            count: screens.length,
            textDirection: TextDirection.ltr,
            effect: ScrollingDotsEffect(),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              Get.offAll(HomeView());
            },
            child: TitleWidget(
              title: "Skip",
              textStyle: subTitleTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
