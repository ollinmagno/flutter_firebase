import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaExibirUsuarios extends StatefulWidget {
  @override
  _TelaExibirUsuariosState createState() => _TelaExibirUsuariosState();
}

class _TelaExibirUsuariosState extends State<TelaExibirUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Exibir usuários"),
        centerTitle: true,
      backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: StreamBuilder(
          stream: Firestore.instance.collection('banco').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasError){
              return new Text('Error: ${snapshot.error}');
            }
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              return new LinearProgressIndicator();
              break;
              default:
                return Center(
                  child: ListView(
                    children: snapshot.data.documents.map<Widget>((DocumentSnapshot doc){
                      return ListTile(
                        title: Text(doc.data['nome'].toString()),
                      );
                      }).toList()
                  ),
                );
            }
          }
        ),
      ),
    );
  }
}