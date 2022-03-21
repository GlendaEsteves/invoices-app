import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoices_app/models/login.dart';
import 'package:invoices_app/models/user.dart';
import 'package:invoices_app/screens/invoices_screen.dart';
import 'package:invoices_app/screens/signup_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(InvoicesApp());
}

class InvoicesApp extends StatelessWidget {
  const InvoicesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoices App',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(30, 33, 57, 100)),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<User> futureUser;
  late Future<Login> futureUserInfo;
  String userId = '';

  final TextEditingController _controllerNickname = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromRGBO(73, 78, 110, 100),
          leading: Image.asset("assets/Slogan.png"),
          actions: const [
            VerticalDivider(
              width: 20,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromRGBO(133, 139, 178, 100),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          height: 400,
                          width: 400,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(73, 78, 110, 100),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(73, 78, 110, 100)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                'Login',
                                style: GoogleFonts.spartan(
                                    textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: _controllerNickname,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: UnderlineInputBorder(),
                                    hintText: 'Usuário'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: _controllerPassword,
                                style: TextStyle(color: Colors.white),
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: UnderlineInputBorder(),
                                    hintText: 'Senha'),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    futureUser = loginUser(
                                        _controllerNickname.text,
                                        _controllerPassword.text);

                                    var userIdAux = await futureUser;
                                    userId = userIdAux.userId.toString();

                                    futureUserInfo = fetchUser(userId);

                                    var user = await futureUserInfo;
                                    if (user.nickname ==
                                        _controllerNickname.text) {
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InvoicesScreen()));
                                    }
                                  },
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      textStyle: GoogleFonts.spartan(
                                          fontWeight: FontWeight.bold)),
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      textStyle: GoogleFonts.spartan()),
                                  onPressed: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                  },
                                  child: const Text(
                                    'Cadastre-se',
                                    style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline),
                                  )),
                            ),
                          ]),
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

Future<Login> fetchUser(String userId) async {
  String baseUrl = ('https://chs-invoice-app-be.herokuapp.com/users/' + userId);
  final response = await http.get(Uri.parse(baseUrl));
  return Login.fromJson(jsonDecode(response.body));
}

Future<User> loginUser(String nickname, String password) async {
  final response = await http.post(
    Uri.parse('https://chs-invoice-app-be.herokuapp.com/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nickname': nickname,
      'password': password,
    }),
  );
  return User.fromJson(jsonDecode(response.body));
}
