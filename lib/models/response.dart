import 'data.dart';

class Response {
    Response({
       required this.id,
       required this.code,
       required this.message,
        this.data,
    });

    String id;
    int code;
    String message;
    Data? data;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["\u0024id"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "code": code,
        "message": message,
        "data": data?.toJson(),
    };
}