import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:grisoftware_demo/controller/short_links_controller.dart';
import 'package:grisoftware_demo/models/error_response_model.dart';
import 'package:grisoftware_demo/models/short_links_model.dart';
import 'package:grisoftware_demo/models/success_response_model.dart';
import 'package:grisoftware_demo/repository/repository.dart';

class TextController extends GetxController {
  ShortLinksController shortLinksController = Get.put(ShortLinksController());
  RxBool isRequestLoading = false.obs;

  TextEditingController textController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool autoValidate = false.obs;
  Rx<SuccessResponse?> successResponse = SuccessResponse().obs;
  Rx<ErrorResponse?> errorResponse = ErrorResponse().obs;
  Repository _repository = Repository();
  final requiredValidator =
      RequiredValidator(errorText: 'Please add a link here');

  setValidateMode(bool value) {
    autoValidate.value = value;
    update();
  }

  Future linkRequest(String link) async {
    isRequestLoading.value = true;
    dynamic result = await _repository.linkRequest(link);
    if (result is SuccessResponse) {
      successResponse.value = result;
      print(successResponse.value?.result?.originalLink.toString());
      print(successResponse.value?.result?.shortLink.toString());
      shortLinksController.addLink(ShortLinks(
          short_link: "${successResponse.value?.result?.shortLink}",
          original_link: '${successResponse.value?.result?.originalLink}',
          time: DateTime.now()));
      isRequestLoading.value = false;
      print('Success');
    } else {
      isRequestLoading.value = false;
      errorResponse.value = result ??
          ErrorResponse(error: "Hata oluştu", errorCode: 1, ok: false);
      print(errorResponse.value?.error.toString());

      print('Error');
      update();
      return Fluttertoast.showToast(
          msg: 'This is not a valid UR',
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.white,
          textColor: Colors.cyan);
    }
    isRequestLoading.value = false;

    update();
  }
}
