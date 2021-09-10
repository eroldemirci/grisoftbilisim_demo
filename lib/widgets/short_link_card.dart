import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grisoftware_demo/controller/short_links_controller.dart';
import 'package:grisoftware_demo/utils/textStyles.dart';
import 'package:grisoftware_demo/widgets/button.dart';

class ShortLinkCard extends StatelessWidget {
  ShortLinkCard(
      {Key? key, this.id, this.originalLink, this.shortLink, this.isCopied})
      : super(key: key);
  final int? id;
  final String? originalLink;
  final String? shortLink;
  bool? isCopied = false;

  @override
  Widget build(BuildContext context) {
    ShortLinksController controller = Get.find<ShortLinksController>();

    return GetBuilder<ShortLinksController>(
      builder: (_controller) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$originalLink',
                    overflow: TextOverflow.ellipsis,
                    style: originalLinkTextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      controller.deleteLink(id);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black54,
              ),
              Text(
                '$shortLink',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                style: shortLinkTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  controller.setCopiedLink(shortLink ?? '');
                  if (shortLink == controller.copiedLink.value) {
                    controller.setIsCopiedValue(true);
                  }
                  print(shortLink);
                },
                child: shortLink == controller.copiedLink.value
                    ? CustomButton(
                        text: 'COPIED !',
                        color: Colors.deepPurple[900],
                      )
                    : CustomButton(
                        text: 'COPY',
                        color: Colors.cyan,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
