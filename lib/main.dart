
import 'package:flutter/material.dart';
main() => runApp(new PerguntaApp()); //arrow function

//StatelessWidget - basicamente um componente sem estado
class PerguntaApp extends StatelessWidget {

var perguntaSelecionada = 0;

  void responder(){
    perguntaSelecionada++;
    print('Pergunta respondida!');
  }

  final perguntas = [
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
  ];

  @override //obrigatoriamente o stateless precisa implementar;
  Widget build(BuildContext context) {
    //widget MaterialApp
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          //criando uma coluna para poder agrupar widgets
          children: <Widget> [
            Text(perguntas[perguntaSelecionada]),
            //botao
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            )
          ],
        ),
      ), //Estruturar a aplicação 
    );
  }
}