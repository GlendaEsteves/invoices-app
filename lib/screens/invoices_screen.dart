import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/user.dart';

class InvoicesScreen extends StatefulWidget {
  InvoicesScreen({Key? key}) : super(key: key);

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 400,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(children: [
                            Positioned(
                              top: 12,
                              left: 0,
                              child: Column(
                                children: const [
                                  Text(
                                    'Faturas',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text('0 Faturas',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Expanded(
                            flex: 3,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Filtro',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: null,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color:
                                            Color.fromRGBO(124, 93, 250, 100),
                                      )),
                                ])),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                              onPressed: null,
                              child: Image.asset("assets/NewButton.png")),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
