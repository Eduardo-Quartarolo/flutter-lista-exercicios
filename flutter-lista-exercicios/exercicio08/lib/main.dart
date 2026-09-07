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
  TextEditingController distanciaController = TextEditingController();
  TextEditingController litrosController = TextEditingController();

  String mensagem = "";

  @override
  void dispose() {
    distanciaController.dispose();
    litrosController.dispose();
    super.dispose();
  }

  void calcular() {
    double distancia = double.tryParse(distanciaController.text) ?? 0;
    double litros = double.tryParse(litrosController.text) ?? 0;

    if (litros == 0) {
      setState(() {
        mensagem = "Digite uma quantidade de combustível válida.";
      });
    } else {
      double consumo = distancia / litros;

      String classificacao;
      if (consumo >= 12) {
        classificacao = "Econômico";
      } else {
        classificacao = "Consumo elevado";
      }

      setState(() {
        mensagem = "Consumo médio: " +
            consumo.toStringAsFixed(1) +
            " km/l\nClassificação: " +
            classificacao;
      });
    }
  }

  void limpar() {
    distanciaController.text = "";
    litrosController.text = "";
    setState(() {
      mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de combustível"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Distância percorrida (km)"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: litrosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Combustível utilizado (L)"),
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
