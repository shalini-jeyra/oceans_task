class Data {
    Data({
      required this.id,
      required  this.dataId,
      required  this.name,
      required  this.email,
      required  this.token,
    });

    String id;
    int dataId;
    String name;
    String email;
    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["\u0024id"],
        dataId: json["Id"],
        name: json["Name"],
        email: json["Email"],
        token: json["Token"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "Id": dataId,
        "Name": name,
        "Email": email,
        "Token": token,
    };
}