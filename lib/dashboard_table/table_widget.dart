import 'package:flutter/material.dart';
import 'package:dashboard_table_master/dashboard_table/table_logic.dart';
import 'package:fstudio/fstudio.dart';

class TableWidget extends FPage<TableLogic> {
  @override
  void initialize() {
    setLogic(TableLogic());
  }

  @override
  Widget buildLayout(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: logic.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        PaginatedDataTable(
                          showCheckboxColumn: true,
                          rowsPerPage: 7,
                          columns: const [
                            DataColumn(label: Text('uid')),
                            DataColumn(label: Text('Country Code')),
                            DataColumn(label: Text('Period')),
                            DataColumn(label: Text('Min Weight')),
                            DataColumn(label: Text('Max Weight')),
                            DataColumn(label: Text('Penalty Percentage')),
                            DataColumn(label: Text('Reward Percentage')),
                          ],
                          source:
                              logic.createDataSource(context, snapshot.data!),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Print Selected Row'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
