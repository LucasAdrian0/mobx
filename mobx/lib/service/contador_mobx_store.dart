import 'package:mobx/mobx.dart';

// Include generated file
part 'contador_mobx_store.g.dart';

// This is the class used by rest of your codebase
class CounterMobXStore = _CounterMobXStore with _$CounterMobXStore;

// The store-class
abstract class _CounterMobXStore with Store {
  @observable
  int contador = 0;

  @action
  void incrementar() {
    contador++;
  }
}