import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoices_app/main.dart';
import 'package:invoices_app/models/user.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _controllerFullName = TextEditingController();
  final TextEditingController _controllerNickname = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  Future<User>? _futureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                          height: 550,
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
                                'Cadastre-se',
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
                                controller: _controllerFullName,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: UnderlineInputBorder(),
                                    hintText: 'Nome e Sobrenome'),
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
                              child: TextFormField(
                                controller: _controllerEmail,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: UnderlineInputBorder(),
                                    hintText: 'E-mail'),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _futureUser = createUser(
                                          _controllerFullName.text,
                                          _controllerNickname.text,
                                          _controllerEmail.text,
                                          _controllerPassword.text);
                                    });
                                  },
                                  child: const Text(
                                    'Cadastrar',
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
                                            builder: (context) => MyHomePage(
                                                  title: '',
                                                )));
                                  },
                                  child: const Text(
                                    'Login',
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

  FutureBuilder<User> buildFutureBuilder() {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Text('Cadastro Realizado');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
