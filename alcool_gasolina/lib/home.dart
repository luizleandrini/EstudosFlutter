import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);


    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Numero invavlido, digite numeros maiores que 0 e utilizando (.)";
      });
    }else{
      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
      });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
      });
      }
      _limparCampos();
    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        
        child: SingleChildScrollView(  //usa isso quando tem varios conteudos para ser exibidos
          padding: EdgeInsets.all(32
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opçao para abastecer",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço alcool, ex: 2.25"
              ),
              style: TextStyle(
                fontSize: 22
                ),
                controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço gasolina, ex: 4.50"
              ),
              style: TextStyle(
                fontSize: 22
                ),
                controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 20
                  ),
                  ),
                onPressed: _calcular
                ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
                ),
              )
          ],
        ),
        )
      ),
    );
  }
}