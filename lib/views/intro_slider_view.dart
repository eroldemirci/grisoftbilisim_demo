import 'package:flutter/material.dart';
import 'package:grisoftware_demo/view_models/intro_slider_view_model.dart';

class IntroSliderView extends StatelessWidget {
  const IntroSliderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: SafeArea(child: IntroSliderViewModel()),
    );
  }
}
