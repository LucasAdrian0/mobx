import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pacotes/service/contador_mobx_store.dart';

class ContadorMobXStorePage extends StatelessWidget {
  ContadorMobXStorePage({super.key});
  CounterMobXStore contadorMobXStore = CounterMobXStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Contador MobX Store", style: TextStyle(fontSize: 26)),
        Observer(
          builder: (context) {
            return Text(
              "${contadorMobXStore.contador}",
              style: TextStyle(fontSize: 26),
            );
          },
        ),
        TextButton(
          onPressed: () {
            contadorMobXStore.incrementar();
          },
          child: Text("Incrementar"),
        ),
      ],
    );
  }
}
