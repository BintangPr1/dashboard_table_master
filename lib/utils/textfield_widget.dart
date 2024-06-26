import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const TextFieldWithLabel(
      {super.key, required this.label, required this.controller});

  @override
  State<TextFieldWithLabel> createState() => _TextField1State();
}

class _TextField1State extends State<TextFieldWithLabel> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Text("${widget.label}:", style: const TextStyle(fontSize: 14)),
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: widget.controller,
            decoration: const InputDecoration(
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
