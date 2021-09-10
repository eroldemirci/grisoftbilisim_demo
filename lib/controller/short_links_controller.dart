import 'package:get/get.dart';
import 'package:grisoftware_demo/database/db_helper.dart';
import 'package:grisoftware_demo/models/short_links_model.dart';
import 'package:flutter/services.dart';

class ShortLinksController extends GetxController {
  List<ShortLinks> allLinks = [];
  RxString copiedLink = ''.obs;
  RxBool isCopied = false.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    refreshLinks();
    super.onInit();
  }

  @override
  void onClose() {
    DatabaseHelper.instance.close();
    super.onClose();
  }

  setCopiedLink(String value) {
    copiedLink.value = value;
    Clipboard.setData(ClipboardData(text: copiedLink.value));
    update();
  }

  setIsCopiedValue(bool value) {
    isCopied.value = value;
    update();
  }

  Future refreshLinks() async {
    allLinks = await DatabaseHelper.instance.readAllLinks();
    // allLinks.clear();
    update();
  }

  Future addLink(ShortLinks link) async {
    await DatabaseHelper.instance.addLink(link);
    refreshLinks();
  }

  Future deleteLink(int? id) async {
    if (id != null) {
      await DatabaseHelper.instance.deleteLink(id);
    }
    refreshLinks();
  }
}
