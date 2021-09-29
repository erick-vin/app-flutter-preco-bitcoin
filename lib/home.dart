import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _valorBitcoin = "";

  void _pesquisar() async {
    var url = Uri.parse("https://blockchain.info/ticker");
    http.Response response;

    response = await http.get(url);

    Map<String, dynamic> retorno = jsonDecode(response.body);
    var pais = retorno["BRL"];

    setState(() {
      _valorBitcoin = "R\$ ${pais["last"]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("imagens/bitcoin.png"),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              _valorBitcoin,
              style: TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(247, 147, 26, 1)),
                onPressed: _pesquisar,
                child: Text(
                  "Atualizar",
                ),
              )),
        ],
      ),
    );
  }
}

//https://blockchain.info/ticker
