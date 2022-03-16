import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const InvoicesApp());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromRGBO(73, 78, 110, 100),
          leading: Image.asset("assets/Slogan.png"),
          actions: [
            const VerticalDivider(
              width: 20,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromRGBO(133, 139, 178, 100),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                    onTap: null,
                    child: const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                            backgroundImage: AssetImage("assets/Oval.png")))))
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
                                style: TextStyle(color: Colors.white),
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
