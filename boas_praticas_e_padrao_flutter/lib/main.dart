import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pacotes/models/lista_tarefa_store.dart';
import 'package:pacotes/repository/jsonplaceholder_custon_dio.dart';
import 'my_app.dart';
import 'repository/comments_repository.dart';
import 'repository/implementation/comment_dio_repository.dart';
import 'repository/implementation/posts_dio_repository.dart';
import 'repository/posts_repository.dart';
import 'service/counter_mobx_service.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerSingleton<CounterMobXService>(CounterMobXService());
  getIt.registerSingleton<JsonPlaceHolderCustonDio>(JsonPlaceHolderCustonDio());

  getIt.registerSingleton<PostsRepository>(
    PostsDioRepository(getIt<JsonPlaceHolderCustonDio>()),
  );
  getIt.registerSingleton<CommentsRepository>(
    CommentDioReposiotory(getIt<JsonPlaceHolderCustonDio>()),
  );
  getIt.registerSingleton<ListaTarefasStore>(ListaTarefasStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupGetIt();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('pt', 'BR')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('pt', 'BR'),
      startLocale: Locale('pt', 'BR'),
      child: const MyApp(),
    ),
  );
}
