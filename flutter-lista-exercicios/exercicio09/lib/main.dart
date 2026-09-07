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
  TextEditingController produtoController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  String mensagem = "";

  @override
  void dispose() {
    produtoController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  void calcular() {
    String produto = produtoController.text;
    double preco = double.tryParse(precoController.text) ?? 0;
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;

    double subtotal = preco * quantidade;

    double desconto = 0;
    if (subtotal > 500) {
      desconto = subtotal * 0.10;
    }

    double total = subtotal - desconto;

    setState(() {
      mensagem = "Produto: " +
          produto +
          "\nQuantidade: " +
          quantidade.toString() +
          "\nSubtotal: R\$ " +
          subtotal.toStringAsFixed(2) +
          "\nDesconto: R\$ " +
          desconto.toStringAsFixed(2) +
          "\nTotal: R\$ " +
          total.toStringAsFixed(2);
    });
  }

  void limpar() {
    produtoController.text = "";
    precoController.text = "";
    quantidadeController.text = "";
    setState(() {
      mensagem = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema simples de vendas"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: produtoController,
              decoration: InputDecoration(labelText: "Produto"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço unitário"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Quantidade"),
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
