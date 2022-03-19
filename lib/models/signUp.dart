class SignUp {
  String fullName;
  String nickname;
  String email;
  String password;

  SignUp(
      {this.fullName = '',
      this.nickname = '',
      this.email = '',
      this.password = ''});

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
      fullName: json['fullName'],
      nickname: json['nickname'],
      email: json['email'],
      password: json['password'],
    );
  }
}
