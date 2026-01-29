import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pacotes/pages/splash_screen/splash_screen__delay_page.dart';
import 'package:pacotes/repository/tarefa_repository.dart';
import 'package:pacotes/service/contador_service.dart';
import 'package:pacotes/service/dark_mode_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
          create: (_) => DarkModeService(),
        ),
        ChangeNotifierProvider<ContadorService>(
          create: (_) => ContadorService(),
        ),
        ChangeNotifierProvider<TarefaRepository>(create: (_) => TarefaRepository())
      ],
      child: Consumer<DarkModeService>(
        builder: (_, DarkModeService, widget) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,

            debugShowCheckedModeBanner: false,
            theme: DarkModeService.darkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            home: const SplashScreenDelayPage(),
          );
        },
      ),
    );
  }
}
