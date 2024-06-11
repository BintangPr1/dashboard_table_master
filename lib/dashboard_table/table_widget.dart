import 'package:flutter/material.dart';
import 'package:dashboard_table_master/dashboard_table/table_logic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fstudio/fstudio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class TableWidget extends FPage<TableLogic> {
  late List<List<dynamic>> result = [];
  @override
  void initialize() {
    setLogic(TableLogic());
    fetchData();
  }

  var data;

  void fetchData() async {
    data = await supabase.from('master_staking_period').select('*');
    print(data[0]['uid']);
  }

  @override
  Widget buildLayout(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
            rowsPerPage: 5,
            columns: const [
              DataColumn(label: Text('uid')),
              DataColumn(label: Text('Country Code')),
              DataColumn(label: Text('Period')),
              DataColumn(label: Text('Min Weight')),
              DataColumn(label: Text('Max Weight')),
              DataColumn(label: Text('Penalty Percentage')),
              DataColumn(label: Text('Reward Percentage')),
            ],
            source: _DataSource(context, result),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('asdasd'))
        ],
      ),
    );
  }
}

class _Row {
  final int uid;
  final int countryCode;
  final String period;
  final int minWeight;
  final int maxWeight;
  final double penaltyPercentage;
  final double rewardPercentage;

  _Row(
    this.uid,
    this.countryCode,
    this.period,
    this.minWeight,
    this.maxWeight,
    this.penaltyPercentage,
    this.rewardPercentage,
  );

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context, List<List<dynamic>> data) {
    _rows = data.map((row) {
      return _Row(
        row[0],
        row[1],
        row[2],
        row[3],
        row[4],
        row[5],
        row[6],
      );
    }).toList();
  }

  final BuildContext context;
  late List<_Row> _rows;

  int _selectedCount = 0;
  int? _selectedIndex;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          if (_selectedIndex != null) {
            _rows[_selectedIndex!].selected = false;
          }
          _selectedIndex = value! ? index : null;
          _selectedCount = value ? 1 : 0;
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.uid.toString())),
        DataCell(Text(row.countryCode.toString())),
        DataCell(Text(row.period)),
        DataCell(Text(row.minWeight.toString())),
        DataCell(Text(row.maxWeight.toString())),
        DataCell(Text(row.penaltyPercentage.toString())),
        DataCell(Text(row.rewardPercentage.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
