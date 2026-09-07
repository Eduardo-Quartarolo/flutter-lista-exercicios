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
  TextEditingController numeroController = TextEditingController();

  String mensagem = "";

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  void calcular() {
    int? numero = int.tryParse(numeroController.text);

    if (numero == null) {
      setState(() {
        mensagem = "Digite um número válido.";
      });
    } else {
      int antecessor = numero - 1;
      int sucessor = numero + 1;

      setState(() {
        mensagem = "Número: " +
            numero.toString() +
            "\nAntecessor: " +
            antecessor.toString() +
            "\nSucessor: " +
            sucessor.toString();
      });
    }
  }

  void limpar() {
    numeroController.text = "";
    setState(() {
      mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Antecessor e sucessor"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Número"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  child: Text("Calcular"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limpar,
                  child: Text("Limpar"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              mensagem,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
