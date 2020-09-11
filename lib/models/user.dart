class User {
  User({this.id, this.token, this.phone, this.message, this.status});

  int id;
  String token, phone, message, status;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      token: json["token"],
      phone: json["phone"],
      message: json["message"],
      status: json["status"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "phone": phone,
        "message": message,
        "status": status
      };
}
