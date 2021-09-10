import 'package:flutter/material.dart';
import 'package:grisoftware_demo/utils/textStyles.dart';

import 'package:grisoftware_demo/widgets/title.dart';

class SliderCardWidget extends StatelessWidget {
  const SliderCardWidget({Key? key, this.title, this.subTitle})
      : super(key: key);
  final String? title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: size.width <= 500 ? size.width * 0.8 : size.width * 0.6,
            height: size.width <= 500 ? size.height * 0.4 : size.height * 0.5,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: TitleWidget(
                    title: title ?? '',
                    textStyle: titleTextStyle,
                  ),
                ),
                Flexible(
                  child: TitleWidget(
                    title: subTitle ?? '',
                    textStyle: subTitleTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
