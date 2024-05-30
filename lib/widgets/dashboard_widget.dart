import 'package:dashboard_table_master/widgets/dashboard_widget_button.dart';
import 'package:dashboard_table_master/widgets/dashboard_widget_search.dart';
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
            child: DashboardWidgetButton(),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 2,
            child: DashboardWidgetSearch(),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
