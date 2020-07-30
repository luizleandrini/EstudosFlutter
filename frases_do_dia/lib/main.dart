import 'package:flutter/material.dart';
import 'dart:math';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "Quando você elimina o impossível, o que sobra, por mais improvável que pareça, só pode ser a verdade.", 
    "A dúvida é o principio da sabedoria.",
    "A grandeza não consiste em receber honras, mas em merecê-las",
    "Nenhum homem é uma ilha inteira de si mesmo; todo homem é parte do continente, parte do todo.",
    "O coração tem razões que a própria razão desconhece.",
    "Você pode encarar o erro como uma besteira a ser esquecida, ou como um resultado que aponta uma nova direção",
    "Tenha coragem de seguir o que seu coração e sua intuição dizem. Eles já sabem o que você realmente deseja. Todo o resto é secundário",
    "A única maneira de fazer um bom trabalho é amando o que você faz. Se você ainda não encontrou, continue procurando. Não se desespere. Assim como no amor, você saberá quando tiver encontrado.",
    "Não deixe que o ruído da opinião alheia impeça que você escute a sua voz interior.",
    "Aprenda a parar de desperdiçar energia mental com coisas que estão além do seu controle",
    "A persistência é o menor caminho do êxito",
    "Coragem é a resistência ao medo, domínio do medo, e não a ausência do medo.",
    "Por isso, não fiquem preocupados com o dia de amanhã, pois o dia de amanhã trará as suas próprias preocupações. Para cada dia bastam as suas próprias dificuldades.",
    "Um homem sem propósito é como um navio sem leme.",
    "A alegria está na luta, na tentativa, no sofrimento envolvido. Não na vitória propriamente dita",
    "Não existe um caminho para a felicidade. A felicidade é o caminho.",
    "Você deve ser a mudança que deseja ver no mundo.",
    "Você pode fazer qualquer coisa, mas não tudo.",
    "Você perde 100% dos tiros que nunca dá!",
    "Para o homem que só tem um martelo, tudo que ele encontra começa a parecer com um prego.",
    "A imaginação é mais importante que a ciência, porque a ciência é limitada, ao passo que a imaginação abrange o mundo inteiro.",
    "A felicidade não se resume na ausência de problemas, mas sim na sua capacidade de lidar com eles.",
    "O impossível existe até que alguém duvide dele e prove o contrário.",
    "Todas as riquezas do mundo não valem um bom amigo.",
    "Enquanto a cor da pele for mais importante que o brilho dos olhos, haverá guerra.",
    "A coisa mais difícil é a decisão de agir, o resto é apenas tenacidade.",
    "A vida é aquilo que acontece enquanto você está fazendo outros planos.",
    "A Mente É Tudo. O Que Você Pensa, Você Se Torna.",
    "Esvazie sua mente, seja como a água, se você coloca água em um copo, ela se torna um copo, se você a coloca em uma garrafa ela se torna uma garrafa, se você a coloca em uma chaleira, ela se torna uma chaleira, a água pode fluir mas também destruir, seja água meu amigo",
    "Se você pensa que pode ou se pensa que não pode, de qualquer forma você está certo.",
    "As pessoas costumam dizer que a motivação não dura sempre. Bem, nem o efeito do banho, por isso recomenda-se diariamente.",
  ];

  var _fraseGerada = "Clique a  baixo para gerar uma frase!";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
        padding: EdgeInsets.all(16),
        //width: double.infinity,
        /*decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber)
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            RaisedButton(
              child: Text(
                "Nova frase!",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
              color: Colors.green,
              onPressed: _gerarFrase,
            )
          ],
        ),
      ),
      ),
    );
  }
}