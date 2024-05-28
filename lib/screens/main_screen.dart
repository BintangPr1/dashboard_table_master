import 'package:dashboard_table_master/widgets/dashboard_widget.dart';
import 'package:dashboard_table_master/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              child: SideMenuWidget(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 8,
            child: DashboardWidget(),
          ),
        ],
      )),
    );
  }
}
