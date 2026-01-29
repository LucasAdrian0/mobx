import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'tarefa__mobx_model.g.dart';

// This is the class used by rest of your codebase
class TarefaStore = _TarefaStore with _$TarefaStore;

abstract class _TarefaStore with Store {
  final String id = UniqueKey().toString();

  @observable
  String descricao = "";

  @observable
  bool concluido = false;

  _TarefaStore(this.descricao, this.concluido);

  @action
  alterar(String pDescricao, bool pConcluido) {
    descricao = pDescricao;
    concluido = pConcluido;
  }
}
