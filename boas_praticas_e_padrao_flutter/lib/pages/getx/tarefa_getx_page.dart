import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/lista_de_tarefa_controller.dart';


class TarefaGetXPage extends StatelessWidget {
  var descricaoController = TextEditingController();
  var listaTarefaController = ListaDeTarefaController();

  TarefaGetXPage({super.key});

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
                      listaTarefaController.adicionar(descricaoController.text);
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
                  Obx(() {
                    return Switch(
                      value: listaTarefaController.apenasNaoConcluidos,
                      onChanged: listaTarefaController.setApenasNaoConcluidos,
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: listaTarefaController.tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = listaTarefaController.tarefas[index];
                    return Dismissible(
                      onDismissed: (DismissDirection dismissDerection) async {
                        listaTarefaController.excluir(tarefa.id);
                      },
                      key: Key(tarefa.descricao),
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                          onChanged: (bool value) async {
                            tarefa.concluido = value;
                            listaTarefaController.alterar(
                              tarefa.id,
                              tarefa.descricao,
                              tarefa.concluido,
                            );
                          },
                          value: tarefa.concluido,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
