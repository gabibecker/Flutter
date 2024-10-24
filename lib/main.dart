import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp()); //arrow function

//para gerenciar o estado do widget
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 8},
        {'texto': 'Rosa', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual é a seu animal favorito?',
      'respostas': [
        {'texto': 'Calopsita', 'pontuacao': 6},
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Lontra', 'pontuacao': 2},
        {'texto': 'Capivara', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Qual é a sua matéria favorita?',
      'respostas': [
        {'texto': 'Matemática', 'pontuacao': 10},
        {'texto': 'Ciências', 'pontuacao': 2},
        {'texto': 'Português', 'pontuacao': 1},
        {'texto': 'Geografia', 'pontuacao': 3},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });

      print(_pontuacaoTotal);
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
          title: Center(
            child: Text(
              'Perguntas',
              style: TextStyle(
                color: Colors.white,
              ),
            ), 
          ),
          backgroundColor: Colors.pink,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
