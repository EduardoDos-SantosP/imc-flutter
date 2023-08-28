import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade700),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _HomeState();
}

class _HomeState extends State<MyHomePage> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  String msg = '';

  String getDescricaoImc(double imc) {
    if (imc < 18.5) return "Abaixo do peso";
    if (imc < 25) return "Peso ideal (parabéns)";
    if (imc < 30) return "Levemente acima do peso";
    if (imc < 35) return "Obesidade grau 1";
    if (imc < 40) return "Obesidade grau 2 (severa)";
    return "Obesidade grau 3 (mórbida)";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("IMC"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 450,
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/balanca.png', height: 100),
                TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Peso"),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Altura"),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      var peso = double.parse(pesoController.text);
                      var altura = double.parse(alturaController.text);
                      var imc = peso / (altura * altura);

                      setState(() => msg = getDescricaoImc(imc));
                    },
                    child: const Text("Calcular"),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 450,
                  height: 150,
                  child: Text(msg),
                )
              ],
            ),
          ),
        ));
  }
}
