import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

void main() {
  runApp(const InvoicesApp());
}

class InvoicesApp extends StatelessWidget {
  const InvoicesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoices App',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0x231F20)),
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
                          color: Color.fromRGBO(73, 78, 110, 100),
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
