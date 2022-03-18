class User {
  String fullName;
  String nickname;
  String email;
  String password;

  User(
      {required this.fullName,
      required this.nickname,
      required this.email,
      this.password = ''});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      nickname: json['nickname'],
      email: json['email'],
      password: json['password'],
    );
  }
}
