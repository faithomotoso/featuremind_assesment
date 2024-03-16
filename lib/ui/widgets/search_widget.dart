import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool readOnly;

  const SearchWidget(
      {required this.textEditingController, this.readOnly = false, super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
          hintText: "Search news...",
          hintStyle: TextStyle(
              color: Theme.of(context).hintColor.withOpacity(0.4)),
          border: InputBorder.none,
          fillColor: Colors.blueGrey.withOpacity(0.08),
          filled: true),
      readOnly: widget.readOnly,
      maxLines: null,
      textCapitalization: TextCapitalization.sentences,
      validator: (v) {
        if (v == null || v.isEmpty) return "Enter a value";
        return null;
      },
    );
  }
}
