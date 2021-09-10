import 'package:flutter/material.dart';
import 'package:grisoftware_demo/utils/textStyles.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({
    Key? key,
    this.title,
    this.textStyle,
  }) : super(key: key);

  final String? title;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: textStyle ?? titleTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
