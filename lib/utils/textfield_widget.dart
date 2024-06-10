import 'package:flutter/material.dart';

class TextField1 extends StatefulWidget {
  final String label;
  const TextField1({super.key, required this.label});

  @override
  State<TextField1> createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200, // Fixed width for the label
          child: Text(widget.label + ":", style: TextStyle(fontSize: 14)),
        ),
        SizedBox(
          width: 300, // Fixed width for the TextField
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true, // Reduces height of TextField
              contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8), // Adds padding inside the TextField
            ),
          ),
        ),
      ],
    );
  }
}
