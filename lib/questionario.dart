import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
  return perguntaSelecionada < perguntas.length;
}

  @override
  Widget build(BuildContext context) {
    List<String> respostas = (perguntas[perguntaSelecionada]['respostas'] as List<String>);

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((t) => Resposta(t, responder)).toList(),
      ],
    );
  }
}
