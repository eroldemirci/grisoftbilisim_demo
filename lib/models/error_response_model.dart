import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({
    this.ok,
    this.errorCode,
    this.error,
  });

  bool? ok;
  int? errorCode;
  String? error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        ok: json["ok"] == null ? null : json["ok"],
        errorCode: json["error_code"] == null ? null : json["error_code"],
        error: json["error"] == null ? null : json["error"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok == null ? null : ok,
        "error_code": errorCode == null ? null : errorCode,
        "error": error == null ? null : error,
      };
}
