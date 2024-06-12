import 'package:flutter/material.dart';
import 'package:dashboard_table_master/dashboard_table/table_widget.dart';
import 'package:fstudio/fstudio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class TableLogic extends FPageLogic<TableWidget> {
  // Make the class a singleton
  static final TableLogic _instance = TableLogic._internal();

  factory TableLogic() {
    return _instance;
  }

  TableLogic._internal();

  _Row? selectedRow;

  Future<List<Map<String, dynamic>>> fetchData() async {
    return await supabase.from('master_staking_period').select('*');
  }

  DataTableSource createDataSource(
      BuildContext context, List<Map<String, dynamic>> data) {
    return _DataSource(context, data, (row) {
      selectedRow = row;
    });
  }
}

class _Row {
  final int uid;
  final String countryCode;
  final String period;
  final double minWeight;
  final double maxWeight;
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
  _DataSource(this.context, List<Map<String, dynamic>> data, this.onRowSelect) {
    _rows = data.map((row) {
      return _Row(
        row['uid'],
        row['country_code'],
        row['period'],
        row['min_weight'],
        row['max_weight'],
        row['penalty_percentage'],
        row['reward_percentage'],
      );
    }).toList();
  }

  final BuildContext context;
  final Function(_Row?) onRowSelect;
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
          onRowSelect(
              value ? row : null); // Call the callback with the selected row
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
