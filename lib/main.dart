
import 'package:flutter/material.dart';
main() => runApp(new PerguntaApp()); //arrow function

//StatelessWidget - basicamente um componente sem estado
class PerguntaApp extends StatelessWidget {

  void responder(){
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
          title: Text("Perguntas"),
        ),
        body: Column(
          //criando uma coluna para poder agrupar widgets
          children: <Widget> [
            Text(perguntas[0]),
            //botao
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: () {
                print('Resposta 2 foi selecionada!');
              },
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: () => print('Resposta 3!!!'),
            )
          ],
        ),
      ), //Estruturar a aplicação 
    );
  }
}