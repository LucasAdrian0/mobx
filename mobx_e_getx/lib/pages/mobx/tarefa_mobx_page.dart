import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pacotes/models/lista_tarefa_store.dart';
import 'package:pacotes/models/tarefa_model.dart';
import 'package:pacotes/repository/tarefa_repository.dart';

class TarefaMobXPage extends StatelessWidget {
  var descricaoController = TextEditingController();
  var listaTarefaStore = ListaTarefaStore();

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
                      listaTarefaStore.adicionar(descricaoController.text);
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
                        value: listaTarefaStore.apenasNaoConcluidos,
                        onChanged: (bool value) {
                          listaTarefaStore.setNaoConcluidos(value);
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
                    itemCount: listaTarefaStore.tarefas.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var tarefa = listaTarefaStore.tarefas[index];
                      return Observer(
                        builder: (_) {
                          return Dismissible(
                            onDismissed: (DismissDirection dismissDerection) async {
                              listaTarefaStore.excluir(tarefa.id);
                            },
                            key: Key(tarefa.descricao),
                            child: ListTile(
                              title: Text(tarefa.descricao),
                              trailing: Switch(
                                onChanged: (bool value) async {
                                  tarefa.concluido = value;
                                  listaTarefaStore.alterar(
                                    tarefa.id,
                                    tarefa.descricao,
                                    tarefa.concluido,
                                  );
                                },
                                value: tarefa.concluido,
                              ),
                            ),
                          );
                        }
                      );
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
