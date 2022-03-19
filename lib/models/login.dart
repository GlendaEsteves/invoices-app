class Login {
  String fullName;
  String nickname;
  String email;

  Login({this.fullName = '', this.nickname = '', this.email = ''});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      fullName: json['fullName'],
      nickname: json['nickname'],
      email: json['email'],
    );
  }
}
