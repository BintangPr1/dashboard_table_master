import 'package:flutter/material.dart';

class TextField1 extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const TextField1({super.key, required this.label, required this.controller});

  @override
  State<TextField1> createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Text(widget.label + ":", style: TextStyle(fontSize: 14)),
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            ),
          ),
        ),
      ],
    );
  }
}
