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
  TextEditingController celsiusController = TextEditingController();

  String mensagem = "";

  @override
  void dispose() {
    celsiusController.dispose();
    super.dispose();
  }

  void converter() {
    double celsius = double.tryParse(celsiusController.text) ?? 0;
    double fahrenheit = (celsius * 9 / 5) + 32;

    setState(() {
      mensagem = "Temperatura em Fahrenheit: " +
          fahrenheit.toStringAsFixed(1) +
          " °F";
    });
  }

  void limpar() {
    celsiusController.text = "";
    setState(() {
      mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de temperatura"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Temperatura em Celsius"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: converter,
                  child: Text("Converter"),
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
