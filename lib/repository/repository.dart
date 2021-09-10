import 'package:grisoftware_demo/services/service.dart';

class Repository {
  Service _service = Service();
  Future<dynamic> linkRequest(String link) async {
    var result = await _service.shortLinkResponse(link);
    return result;
  }
}
