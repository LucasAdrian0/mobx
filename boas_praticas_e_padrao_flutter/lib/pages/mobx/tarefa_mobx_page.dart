import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pacotes/shared/widget/tarefa_item.dart';

import '../../main.dart';
import '../../models/lista_tarefa_store.dart';

class TarefaMobXPage extends StatelessWidget {
  var descricaoController = TextEditingController();
  var listaTarefasStore = getIt<ListaTarefasStore>();

  TarefaMobXPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          descricaoController.text = "";
          showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                title: const Text("Adicionar tarefa"),
                content: TextField(controller: descricaoController),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () async {
                      listaTarefasStore.adicionar(descricaoController.text);
                      Navigator.pop(context);
                    },
                    child: Text("Salvar"),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text("Tarefa MobX Store", style: TextStyle(fontSize: 26)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluidos",
                    style: TextStyle(fontSize: 18),
                  ),
                  Observer(
                    builder: (_) {
                      return Switch(
                        value: listaTarefasStore.apenasNaoConcluidos,
                        onChanged: (bool value) {
                          listaTarefasStore.setNaoConcluidos(value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    itemCount: listaTarefasStore.tarefas.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var tarefa = listaTarefasStore.tarefas[index];
                      return TarefaItem(tarefa: tarefa);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
