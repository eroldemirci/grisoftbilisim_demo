import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width <= 500 ? size.width * 0.6 : size.width * 0.5,
        height: size.width <= 500 ? size.height * 0.4 : size.height * 0.3,
        child: SvgPicture.asset(
          'lib/assets/images/illustration.svg',
          fit: BoxFit.fill,
        ));
  }
}

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        child: SvgPicture.asset(
          'lib/assets/images/logo.svg',
          fit: BoxFit.fill,
        ));
  }
}

class TitleImage extends StatelessWidget {
  const TitleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset(
      'lib/assets/images/logo.svg',
      fit: BoxFit.fill,
    ));
  }
}
