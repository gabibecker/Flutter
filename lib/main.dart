import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp()); //arrow function

//para gerenciar o estado do widget
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if(temPerguntaSelecionada) {
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
  
  List<String> respostas =  temPerguntaSelecionada ? _perguntas[_perguntaSelecionada].cast()['respostas'] : [];
  
    //widget MaterialApp
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Column(
          //criando uma coluna para poder agrupar widgets
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
            //botao
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ): null,
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
