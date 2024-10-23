import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp()); //arrow function

//para gerenciar o estado do widget
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 8},
        {'texto': 'Rosa', 'nota': 10},
        {'texto': 'Branco', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 2},
      ],
    },
    {
      'texto': 'Qual é a seu animal favorito?',
      'respostas': [
         {'texto':'Calopsita', 'nota': 6},
         {'texto':'Gato', 'nota': 10},
         {'texto':'Lontra', 'nota': 2},
         {'texto':'Capivara', 'nota': 9},
      ],
    },
    {
      'texto': 'Qual é a sua matéria favorita?',
      'respostas': [
         {'texto':'Matemática', 'nota': 10},
         {'texto':'Ciências', 'nota': 2},
         {'texto':'Português', 'nota': 1},
         {'texto':'Geografia', 'nota': 3},
      ],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override //obrigatoriamente o stateless precisa implementar;
  Widget build(BuildContext context) {

    //widget MaterialApp
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(),
      ), //Estruturar a aplicação
    );
  }
}

//StatelessWidget - basicamente um componente sem estado
class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
