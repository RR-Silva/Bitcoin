import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _valorBitcoin = "0";

void _atualizarValor() async{
String url = "https://blockchain.info/ticker";
http.Response response;
response = await http.get(Uri.parse(url));
Map<String, dynamic> retorno = jsonDecode(response.body);
//print("Resultado : " + retorno["BRL"]["buy"].toString());

setState(() {
  _valorBitcoin = retorno["BRL"]["buy"].toString();
});

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Padding(padding: EdgeInsets.all(40),
            child: Image.asset('images/bitcoin.png'),
            ),
            Padding(padding: EdgeInsets.only(top: 30),
            child: Text("R\$ " +_valorBitcoin,style: TextStyle(fontSize: 40),),
            ),
            Padding(padding: EdgeInsets.only(top: 40),
            child: ElevatedButton(child: Text("Atualizar", style: TextStyle(fontSize: 20), ),
            onPressed: _atualizarValor, style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), ),
            )
          ],
        ),
      ),
    );

  }
}