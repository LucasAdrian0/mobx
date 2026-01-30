// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_tarefa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaTarefaStore on _ListaTarefaStore, Store {
  Computed<List<TarefaStore>>? _$tarefasComputed;

  @override
  List<TarefaStore> get tarefas =>
      (_$tarefasComputed ??= Computed<List<TarefaStore>>(
        () => super.tarefas,
        name: '_ListaTarefaStore.tarefas',
      )).value;

  late final _$_apenasNaoConcluidosAtom = Atom(
    name: '_ListaTarefaStore._apenasNaoConcluidos',
    context: context,
  );

  @override
  Observable<bool> get _apenasNaoConcluidos {
    _$_apenasNaoConcluidosAtom.reportRead();
    return super._apenasNaoConcluidos;
  }

  @override
  set _apenasNaoConcluidos(Observable<bool> value) {
    _$_apenasNaoConcluidosAtom.reportWrite(
      value,
      super._apenasNaoConcluidos,
      () {
        super._apenasNaoConcluidos = value;
      },
    );
  }

  late final _$_ListaTarefaStoreActionController = ActionController(
    name: '_ListaTarefaStore',
    context: context,
  );

  @override
  void setNaoConcluidos(bool value) {
    final _$actionInfo = _$_ListaTarefaStoreActionController.startAction(
      name: '_ListaTarefaStore.setNaoConcluidos',
    );
    try {
      return super.setNaoConcluidos(value);
    } finally {
      _$_ListaTarefaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionar(String descricao) {
    final _$actionInfo = _$_ListaTarefaStoreActionController.startAction(
      name: '_ListaTarefaStore.adicionar',
    );
    try {
      return super.adicionar(descricao);
    } finally {
      _$_ListaTarefaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterar(String id, String descricao, bool concluido) {
    final _$actionInfo = _$_ListaTarefaStoreActionController.startAction(
      name: '_ListaTarefaStore.alterar',
    );
    try {
      return super.alterar(id, descricao, concluido);
    } finally {
      _$_ListaTarefaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void excluir(String id) {
    final _$actionInfo = _$_ListaTarefaStoreActionController.startAction(
      name: '_ListaTarefaStore.excluir',
    );
    try {
      return super.excluir(id);
    } finally {
      _$_ListaTarefaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas}
    ''';
  }
}
