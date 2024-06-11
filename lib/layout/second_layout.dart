import 'package:dashboard_table_master/dashboard_crud/button_widget.dart';
import 'package:dashboard_table_master/dashboard_search/search_widget.dart';
import 'package:dashboard_table_master/dashboard_table/table_widget.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ButtonWidget().getWidget(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: SearchWidget().getWidget(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 10,
            child: TableWidget().getWidget(),
          ),
        ],
      ),
    );
  }
}
