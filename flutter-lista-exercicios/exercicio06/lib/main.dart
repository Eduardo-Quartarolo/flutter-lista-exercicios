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
  TextEditingController numero1Controller = TextEditingController();
  TextEditingController numero2Controller = TextEditingController();

  String mensagem = "";

  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  void somar() {
    double numero1 = double.tryParse(numero1Controller.text) ?? 0;
    double numero2 = double.tryParse(numero2Controller.text) ?? 0;
    double resultado = numero1 + numero2;

    setState(() {
      mensagem = "Resultado: " + resultado.toString();
    });
  }

  void subtrair() {
    double numero1 = double.tryParse(numero1Controller.text) ?? 0;
    double numero2 = double.tryParse(numero2Controller.text) ?? 0;
    double resultado = numero1 - numero2;

    setState(() {
      mensagem = "Resultado: " + resultado.toString();
    });
  }

  void multiplicar() {
    double numero1 = double.tryParse(numero1Controller.text) ?? 0;
    double numero2 = double.tryParse(numero2Controller.text) ?? 0;
    double resultado = numero1 * numero2;

    setState(() {
      mensagem = "Resultado: " + resultado.toString();
    });
  }

  void dividir() {
    double numero1 = double.tryParse(numero1Controller.text) ?? 0;
    double numero2 = double.tryParse(numero2Controller.text) ?? 0;

    if (numero2 == 0) {
      setState(() {
        mensagem = "Erro: não é possível dividir por zero.";
      });
    } else {
      double resultado = numero1 / numero2;
      setState(() {
        mensagem = "Resultado: " + resultado.toString();
      });
    }
  }

  void limpar() {
    numero1Controller.text = "";
    numero2Controller.text = "";
    setState(() {
      mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de quatro operações"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numero1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Número 1"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numero2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Número 2"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: somar,
                  child: Text("+"),
                ),
                ElevatedButton(
                  onPressed: subtrair,
                  child: Text("-"),
                ),
                ElevatedButton(
                  onPressed: multiplicar,
                  child: Text("x"),
                ),
                ElevatedButton(
                  onPressed: dividir,
                  child: Text("/"),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: limpar,
              child: Text("Limpar"),
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
