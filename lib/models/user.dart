class Users {
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? urlImageProfile;
  String? token;

  String? name;
  String? job;

  Users({
    // required this.id,
    // required this.email,
    // required this.password,
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.urlImageProfile,

    this.name,
    this.job,

    this.token

  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] ?? "1",
      email: json['email'] ?? "2",
      password: json['password'] ?? "3",
      token: json['token']
    );
  }

  factory Users.fromJsonTest(Map<String, dynamic> json) {
    return Users(
      id: json['id'].toString(),
      name: json["nama_petugas"] ?? "",
      job: json["jabatan"] ?? "",
      token: json['token']['access_token']
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "token" : token
    };
  }

}