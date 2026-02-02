import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../models/lista_tarefa_store.dart';
import '../../models/tarefa__mobx_model.dart';

import '../../main.dart';

class TarefaItem extends StatelessWidget {
  final TarefaStore tarefa;
  const TarefaItem({super.key, required this.tarefa});


  @override
  Widget build(BuildContext context) {
 var listaTarefasStore = getIt<ListaTarefasStore>();
    return Observer(
      builder: (_) {
        return Dismissible(
          onDismissed: (DismissDirection dismissDerection) async {
            listaTarefasStore.excluir(tarefa.id);
          },
          key: Key(tarefa.descricao),
          child: ListTile(
            title: Text(tarefa.descricao),
            trailing: Switch(
              onChanged: (bool value) async {
                tarefa.concluido = value;
                listaTarefasStore.alterar(
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
  }
}
