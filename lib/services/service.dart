import 'dart:convert';

import 'package:grisoftware_demo/models/error_response_model.dart';
import 'package:grisoftware_demo/models/success_response_model.dart';
import 'package:http/http.dart' as http;

class Service {
  final String baseUrl = 'https://api.shrtco.de/v2/shorten?url=';
  Map<String, String> headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS"
  };
  http.Client client = http.Client();
  Future<dynamic> shortLinkResponse(String link) async {
    print('Bağlantı linki = ' + baseUrl + link);
    //   http.Response response = await client
    //       .get(
    //     Uri.parse(baseUrl + link),
    //     headers: headers,
    //   )
    //       .timeout(Duration(seconds: 10), onTimeout: () {
    //     return http.Response('Error', 500);
    //   });
    //   if (response.statusCode == 200) {
    //     SuccessResponse result =
    //         SuccessResponse.fromJson(jsonDecode(response.body));
    //     return result;
    //   } else {
    //     ErrorResponse errorResult =
    //         ErrorResponse.fromJson(jsonDecode(response.body));
    //     return errorResult;
    //   }

    try {
      var response = await client.get(Uri.parse(baseUrl + link));
      var result = jsonDecode(response.body);
      if (result['ok'] == true) {
        SuccessResponse successResponse = SuccessResponse.fromJson(result);
        return successResponse;
      } else {
        ErrorResponse errorResponse = ErrorResponse.fromJson(result);
        return errorResponse;
      }
    } catch (e) {
      print("Bağlantıda bir hata oluştu = $e ");
    }
  }
}
