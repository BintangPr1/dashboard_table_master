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
            flex: 3,
            child: Container(
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green,
            ),
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
