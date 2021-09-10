import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:grisoftware_demo/controller/short_links_controller.dart';
import 'package:grisoftware_demo/controller/textfield_controller.dart';
import 'package:grisoftware_demo/models/short_links_model.dart';
import 'package:grisoftware_demo/utils/textStyles.dart';
import 'package:grisoftware_demo/widgets/button.dart';
import 'package:grisoftware_demo/widgets/image.dart';
import 'package:grisoftware_demo/widgets/short_link_card.dart';
import 'package:grisoftware_demo/widgets/textfield_bg.dart';
import 'package:grisoftware_demo/widgets/title.dart';

class HomeViewModel extends StatefulWidget {
  const HomeViewModel({
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewModelState createState() => _HomeViewModelState();
}

class _HomeViewModelState extends State<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    TextController _textControllerGetx = Get.put(TextController());
    Size size = MediaQuery.of(context).size;

    return GetBuilder<TextController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<ShortLinksController>(
              builder: (shortLinksController) {
                if (shortLinksController.allLinks.length == 0) {
                  return Expanded(
                    flex: size.width <= 500 ? 7 : 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(flex: 3, child: ImageWidget()),
                        Flexible(
                          child: TitleWidget(
                            title: "Let's get started!",
                            textStyle: titleTextStyle,
                          ),
                        ),
                        Flexible(
                          child: TitleWidget(
                            title:
                                'Paste your first link into the field to shorten it',
                            textStyle: subTitleTextStyle,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Expanded(
                  flex: size.width <= 500 ? 7 : 6,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Your Link History',
                          style: titleTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: size.width < 500
                              ? size.width * 0.8
                              : size.width * 0.6,
                          child: ListView.separated(
                              itemCount: shortLinksController.allLinks.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 20,
                                );
                              },
                              itemBuilder: (context, index) {
                                var data = shortLinksController.allLinks[index];
                                return ShortLinkCard(
                                  id: data.id,
                                  originalLink: data.original_link,
                                  shortLink: data.short_link,
                                );
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Expanded(
              flex: size.width <= 500 ? 3 : 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  TextFieldBackGround(),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Container(
                            width: size.width <= 500
                                ? size.width * 0.8
                                : size.width * 0.6,
                            child: TextFormField(
                              autovalidate: controller.autoValidate.value,
                              controller: controller.textController,
                              validator: controller.requiredValidator,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Shorten a link here ...',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              print(
                                  ' yazı = ' + controller.textController.text);
                              _textControllerGetx.setValidateMode(true);
                              if (controller.formKey.currentState!.validate()) {
                                controller.linkRequest(
                                    controller.textController.text.trim());
                                _textControllerGetx.setValidateMode(false);
                              }

                              controller.textController.clear();
                            },
                            child: CustomButton(
                              text: 'SHORTEN IT!',
                              loading: controller.isRequestLoading.value
                                  ? true
                                  : false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
