import 'package:app_cadastro/view/tela_cadastro.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: TelaCadastro(),
    );
  }
}