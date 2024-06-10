import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class DashboardWidgetTable extends StatefulWidget {
  const DashboardWidgetTable({super.key});

  @override
  State<DashboardWidgetTable> createState() => _DashboardWidgetTableState();
}

class _DashboardWidgetTableState extends State<DashboardWidgetTable> {
  late List<List<dynamic>> result = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final conn = await Connection.open(
      Endpoint(
          host: 'localhost',
          port: 5432,
          database: 'treasury',
          username: 'postgres',
          password: 'September123'),
      settings: const ConnectionSettings(sslMode: SslMode.disable),
    );
    final temp = await conn.execute('SELECT * FROM master_staking_period');

    setState(() {
      result = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
            rowsPerPage: 10,
            columns: const [
              DataColumn(label: Text('uid')),
              DataColumn(label: Text('Country Code')),
              DataColumn(label: Text('Period')),
              DataColumn(label: Text('Min Weight')),
              DataColumn(label: Text('Max Weight')),
              DataColumn(label: Text('Penalty Percentage')),
              DataColumn(label: Text('Reward Percentage')),
            ],
            source: _DataSource(context),
          ),
          ElevatedButton(
              onPressed: () {
                print(result);
              },
              child: const Text('asdasd'))
        ],
      ),
    );
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
  _DataSource(this.context) {
    _rows = <_Row>[
      _Row(1, '+74', '90d', 9.5, 90, 2.3, 5),
      _Row(2, '+62', '14d', 10.5, 100, 2.5, 4),
    ];
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
        DataCell(Text(row.countryCode)),
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
