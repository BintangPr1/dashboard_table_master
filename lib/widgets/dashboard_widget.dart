import 'package:dashboard_table_master/widgets/dashboard_widget_button.dart';
import 'package:dashboard_table_master/widgets/dashboard_widget_search.dart';
import 'package:dashboard_table_master/widgets/dashboard_widget_table.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: DashboardWidgetButton(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            flex: 3,
            child: DashboardWidgetSearch(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            flex: 10,
            child: DashboardWidgetTable(),
          ),
        ],
      ),
    );
  }
}
