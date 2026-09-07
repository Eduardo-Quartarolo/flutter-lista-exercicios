import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  TextEditingController quantidadeController = TextEditingController();

  int estoque = 0;
  String mensagem = "";

  @override
  void dispose() {
    quantidadeController.dispose();
    super.dispose();
  }

  void entrada() {
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;

    setState(() {
      estoque = estoque + quantidade;
      mensagem = "Entrada realizada com sucesso.";
    });
  }

  void saida() {
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;

    if (quantidade > estoque) {
      setState(() {
        mensagem = "Quantidade maior que o estoque disponível.";
      });
    } else {
      setState(() {
        estoque = estoque - quantidade;
        mensagem = "Saída realizada com sucesso.";
      });
    }
  }

  void limparCampo() {
    quantidadeController.text = "";
    setState(() {
      mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controle de estoque"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Quantidade atual em estoque: " + estoque.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Quantidade"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: entrada,
                  child: Text("Entrada"),
                ),
                ElevatedButton(
                  onPressed: saida,
                  child: Text("Saída"),
                ),
                ElevatedButton(
                  onPressed: limparCampo,
                  child: Text("Limpar campo"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              mensagem,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
