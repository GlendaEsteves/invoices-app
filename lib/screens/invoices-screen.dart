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
                          height: 50,
                          width: 400,
                          child: Row(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text('Faturas'),
                                    Text('0 Faturas'),
                                  ],
                                ),
                              ),
                              Text('Filtro'),
                              TextButton(
                                  onPressed: null,
                                  child: Icon(Icons.arrow_drop_down)),
                              ElevatedButton(
                                  onPressed: null,
                                  child: Image.asset("assets/NewButton.png"))
                            ],
                          ),
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
