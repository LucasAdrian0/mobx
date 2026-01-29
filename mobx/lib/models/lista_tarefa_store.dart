import 'package:mobx/mobx.dart';
import 'package:pacotes/models/tarefa__mobx_model.dart';

// Include generated file
part 'lista_tarefa_store.g.dart';

// This is the class used by rest of your codebase
class ListaTarefaStore = _ListaTarefaStore with _$ListaTarefaStore;

abstract class _ListaTarefaStore with Store {
  ObservableList<TarefaStore> _tarefas = ObservableList<TarefaStore>();

@computed
List<TarefaStore> get tarefas => _apenasNaoConcluidos ? _tarefas.where((element) => !element.concluido).toList() :
_tarefas.toList();

  @observable
  var _apenasNaoConcluidos = Observable(false);

  @action
  set apenasNaoConcluidos(bool value) {
    _apenasNaoConcluidos.value = value;
  }

  @action
  void adicionar(String descricao) {
    _tarefas.add(TarefaStore(descricao, false));
  }

  @action
  void alterar(String id, String descricao, bool concluido) {
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.alterar(descricao, concluido);
  }

  @action
  void excluir(String id) {
    _tarefas.removeWhere((element) => element.id == id);
  }
}
