import 'package:get/get.dart';
import 'package:pacotes/models/tarefa_model.dart';

class ListaDeTarefaController extends GetxController {
  final _apenasNaoConcluidos = false.obs;
  bool get apenasNaoConcluidos => _apenasNaoConcluidos.value;

  void setApenasNaoConcluidos(bool value) {
    _apenasNaoConcluidos.value = value;
  }

  final RxList<Tarefa> _tarefas = <Tarefa>[].obs;

  List<Tarefa> get tarefas => _apenasNaoConcluidos.value
      ? _tarefas.where((element) => !element.concluido).toList()
      : _tarefas;

  adicionar(String descricao) {
    _tarefas.add(Tarefa(descricao, false));
  }

  alterar(String id, String descricao, bool concluido) {
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.descricao = descricao;
    tarefa.concluido = concluido;
    _tarefas.refresh();
  }

  excluir(String id) {
    _tarefas.removeWhere((element) => element.id == id);
  }
}
