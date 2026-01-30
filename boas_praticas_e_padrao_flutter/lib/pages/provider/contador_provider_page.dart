import 'package:flutter/material.dart';
import 'package:pacotes/service/contador_provider_service.dart';
import 'package:provider/provider.dart';

class ContadorProviderPage extends StatefulWidget {
  const ContadorProviderPage({super.key});

  @override
  State<ContadorProviderPage> createState() => _ContadorProviderPageState();
}

class _ContadorProviderPageState extends State<ContadorProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Contador Provider",style: TextStyle(fontSize: 26),),
        Consumer<ContadorProviderService>(
          builder: (_, contadorService, widget) {
            debugPrint("build");
            return Text(
              contadorService.contador.toString(),
              style: TextStyle(fontSize: 26),
            );
          },
        ),
        TextButton(
          onPressed: () {
            Provider.of<ContadorProviderService>(
              context,
              listen: false,
            ).incrementar();
          },
          child: Text("Incrementar"),
        ),
      ],
    );
  }
}
