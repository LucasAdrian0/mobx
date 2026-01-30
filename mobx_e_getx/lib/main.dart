import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pacotes/my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:pacotes/service/counter_mobx_service.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  getIt.registerSingleton<CounterMobXService>(CounterMobXService());

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
