import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pacotes/pages/brasil_fields_page/brasil_fields_page.dart';
import 'package:pacotes/pages/contador/contador_page.dart';
import 'package:pacotes/pages/tarefa/tarefa_page.dart';
import 'package:pacotes/service/dark_mode_service.dart';
import 'package:pacotes/shared/widget/custon_drawer.dart';
import 'package:provider/provider.dart';

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
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
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
          TarefaPage(),
          ContadorPage(),
          Container(color: Colors.white),
          Container(color: Colors.yellow),
          Container(color: Colors.red),
          Container(color: Colors.green),
          BrasilFieldsPage(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        {3: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Brasil'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
