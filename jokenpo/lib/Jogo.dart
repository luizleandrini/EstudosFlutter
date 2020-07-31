import 'dart:math';

import 'package:flutter/material.dart';


class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opcao a baixo";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["Pedra", "Papel", "Tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do app: " + escolhaApp);
    print("Escolha do usuario: " + escolhaUsuario);

    switch(escolhaApp){
      case "Pedra":
      setState(() {
        this._imagemApp = AssetImage("images/pedra.png");
      });
      break;
      case "Papel":
      setState(() {
        this._imagemApp = AssetImage("images/papel.png");
      });
      break;
      case "Tesoura":
      setState(() {
        this._imagemApp = AssetImage("images/tesoura.png");
      });
      break;
    }
    //Validacao do ganhador
    if(
      (escolhaUsuario == "Pedra" && escolhaApp == "Tesoura") || 
      (escolhaUsuario == "Tesoura" && escolhaApp == "Papel") ||
      (escolhaUsuario == "Papel" && escolhaApp == "Pedra")
    ){
      setState(() {
        this._mensagem = "Voce ganhou!";
      });
    }else if(
      (escolhaApp == "Pedra" && escolhaUsuario == "Tesoura") ||
      (escolhaApp == "Tesoura" && escolhaUsuario == "Papel") ||
      (escolhaApp == "Papel" && escolhaUsuario == "Pedra") 
    ){
      setState(() {
        this._mensagem = "Voce perdeu!";
      });
    }else{
        setState(() {
        this._mensagem = "Empate!";
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //deixar o texto centralizado
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          
          Image(image: this._imagemApp,),
          
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("Pedra"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Papel"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),
              )

            ],
          )
        ],
      ),
    );
  }
}