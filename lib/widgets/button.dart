import 'package:flutter/material.dart';
import 'package:grisoftware_demo/utils/textStyles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, this.text, this.loading, this.color})
      : super(key: key);
  final String? text;
  final bool? loading;
  Color? color;
  @override
  Widget build(BuildContext context) {
    if (color == null) {
      color = Colors.cyan;
    }
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: size.width <= 500 ? size.width * 0.8 : size.width * 0.6,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: loading != null
          ? loading!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      text ?? '',
                      style: buttonTextStyle,
                    ),
                    loading!
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Container()
                  ],
                )
              : Text(
                  text ?? '',
                  style: buttonTextStyle,
                )
          : Text(
              text ?? '',
              style: buttonTextStyle,
            ),
    );
  }
}
