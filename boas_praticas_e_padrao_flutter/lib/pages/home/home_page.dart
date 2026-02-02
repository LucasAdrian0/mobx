import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../../service/dark_mode_service.dart';
import '../../shared/widget/custon_drawer.dart';
import '../getx/contador_getx_page.dart';
import '../getx/tarefa_getx_page.dart';
import '../mobx/contador_mobx_page.dart';
import '../mobx/contador_mobx_store_page.dart';
import '../mobx/tarefa_mobx_page.dart';
import '../provider/contador_provider_page.dart';
import '../provider/tarefa_provider_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late var tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var darkModeService = Provider.of<DarkModeService>(context);

    return Scaffold(
      drawer: CustonDrawer(),
      appBar: AppBar(
        title: Text("APP_TITLE".tr(), style: GoogleFonts.roboto()),

        actions: [
          Center(child: Text("Dark")),
          Consumer<DarkModeService>(
            builder: (_, DarkModeService, widget) {
              return Switch(
                value: darkModeService.darkMode,
                onChanged: (bool value) {
                  darkModeService.darkMode = !darkModeService.darkMode;
                },
              );
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ContadorProviderPage(),
          TarefaProviderPage(),
          ContadorMobXPage(),
          ContadorMobXStorePage(),
          TarefaMobXPage(),
          ContadorGetXPage(),
          TarefaGetXPage(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        {3: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        items: [
          TabItem(icon: Icons.home, title: 'P1'),
          TabItem(icon: Icons.map, title: 'P2'),
          TabItem(icon: Icons.add, title: 'M1'),
          TabItem(icon: Icons.message, title: 'M2'),
          TabItem(icon: Icons.people, title: 'M3'),
          TabItem(icon: Icons.people, title: 'G1'),
          TabItem(icon: Icons.people, title: 'G2'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
