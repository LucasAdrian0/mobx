import 'package:flutter/material.dart';
import 'package:pacotes/service/contador_service.dart';
import 'package:provider/provider.dart';

class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  State<ContadorPage> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<ContadorService>(
          builder: (_, ContadorService, widget) {
            debugPrint("build");
            return Text(
              ContadorService.contador.toString(),
              style: TextStyle(fontSize: 26),
            );
          },
        ),
        TextButton(
          onPressed: () {
            Provider.of<ContadorService>(context, listen: false).incrementar();
          },
          child: Text("Incrementar"),
        ),
      ],
    );
  }
}
