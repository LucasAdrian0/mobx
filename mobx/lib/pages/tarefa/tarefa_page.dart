import 'package:flutter/material.dart';
import 'package:pacotes/models/tarefa_model.dart';
import 'package:pacotes/repository/tarefa_repository.dart';
import 'package:provider/provider.dart';

class TarefaPage extends StatelessWidget {
  var descricaoController = TextEditingController();

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
                      Provider.of<TarefaRepository>(
                        context,
                        listen: false,
                      ).adicionar(Tarefa(descricaoController.text, false));
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluidos",
                    style: TextStyle(fontSize: 18),
                  ),
                  Consumer<TarefaRepository>(
                    builder: (_, tarefaRepository, widget) {
                      return Switch(
                        value: tarefaRepository.apenasNaoConcluidos,
                        onChanged: (bool value) {
                          tarefaRepository.apenasNaoConcluidos = value;
                          Provider.of<TarefaRepository>(
                            context,
                            listen: false,
                          ).apenasNaoConcluidos = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<TarefaRepository>(
                builder: (_, tarefaRepository, widget) {
                  return ListView.builder(
                    itemCount: tarefaRepository.tarefas.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var tarefa = tarefaRepository.tarefas[index];
                      return Dismissible(
                        onDismissed: (DismissDirection dismissDerection) async {
                          Provider.of<TarefaRepository>(
                            context,
                            listen: false,
                          ).remover(tarefa.id);
                        },
                        key: Key(tarefa.descricao),
                        child: ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(
                            onChanged: (bool value) async {
                              tarefa.concluido = value;
                              Provider.of<TarefaRepository>(
                                context,
                                listen: false,
                              ).alterar(tarefa.id, tarefa.concluido);
                            },
                            value: tarefa.concluido,
                          ),
                        ),
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
