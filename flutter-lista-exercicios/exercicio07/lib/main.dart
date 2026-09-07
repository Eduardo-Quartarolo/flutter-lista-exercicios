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
  TextEditingController nomeController = TextEditingController();
  TextEditingController salarioController = TextEditingController();
  TextEditingController percentualController = TextEditingController();

  String mensagem = "";

  @override
  void dispose() {
    nomeController.dispose();
    salarioController.dispose();
    percentualController.dispose();
    super.dispose();
  }

  void calcular() {
    String nome = nomeController.text;
    double salario = double.tryParse(salarioController.text) ?? 0;
    double percentual = double.tryParse(percentualController.text) ?? 0;

    double aumento = salario * percentual / 100;
    double novoSalario = salario + aumento;

    setState(() {
      mensagem = "Funcionário: " +
          nome +
          "\nSalário atual: R\$ " +
          salario.toStringAsFixed(2) +
          "\nAumento: R\$ " +
          aumento.toStringAsFixed(2) +
          "\nNovo salário: R\$ " +
          novoSalario.toStringAsFixed(2);
    });
  }

  void limpar() {
    nomeController.text = "";
    salarioController.text = "";
    percentualController.text = "";
    setState(() {
      mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reajuste salarial"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: "Nome do funcionário"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: salarioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Salário atual"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: percentualController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Percentual de reajuste"),
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
