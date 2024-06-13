import 'package:dashboard_table_master/layout/second_layout.dart';
import 'package:dashboard_table_master/dashboard_sidemenu/sidemenu_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: SidemenuWidget().getWidget(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            flex: 8,
            child: DashboardWidget(),
          ),
        ],
      )),
    );
  }
}
