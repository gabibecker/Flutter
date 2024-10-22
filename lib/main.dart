
import 'package:flutter/material.dart';
main() => runApp(new PerguntaApp()); //arrow function

//StatelessWidget - basicamente um componente sem estado
class PerguntaApp extends StatelessWidget {

  @override //obrigatoriamente o stateless precisa implementar;
  Widget build(BuildContext context) {
    //widget MaterialApp
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Text('Olá Flutter!!!'),
      ), //Estruturar a aplicação 
    );
  }
}