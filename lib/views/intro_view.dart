import 'package:flutter/material.dart';
import 'package:grisoftware_demo/view_models/intro_view_model.dart';

class IntroFirstScreenView extends StatefulWidget {
  const IntroFirstScreenView({Key? key}) : super(key: key);

  @override
  _IntroFirstScreenViewState createState() => _IntroFirstScreenViewState();
}

class _IntroFirstScreenViewState extends State<IntroFirstScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: IntroFirstScreenModel(),
      ),
    );
  }
}
