import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp()); //arrow function

//para gerenciar o estado do widget
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print('Pergunta respondida!');
  }

  final List<Map<String, Object>> perguntas = [
    { 'texto':'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Rosa', 'Branco', 'Vermelho'],
    },
    { 'texto':'Qual é a seu animal favorito?',
      'respostas': ['Lontra', 'Calopsita', 'Gato', 'Capivara'],
    },
    { 'texto':'Qual é a sua matéria favorita?',
      'respostas': ['Matemática', 'Ciências', 'Português', 'Geografia'],
    },
  ];

   @override //obrigatoriamente o stateless precisa implementar;
  Widget build(BuildContext context) {
  
  List<String> respostas =  perguntas[_perguntaSelecionada].cast()['respostas'];
  
    //widget MaterialApp
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          //criando uma coluna para poder agrupar widgets
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            //botao
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ),
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
