import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldBackGround extends StatelessWidget {
  const TextFieldBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
            color: Colors.deepPurple[900],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset('lib/assets/images/shape.svg'))
        ],
      ),
    );
  }
}
