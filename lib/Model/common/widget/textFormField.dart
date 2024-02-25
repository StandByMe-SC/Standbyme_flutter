import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/color.dart';

/// Represents a TextFormField with customized styling.
class TFF {
  String cnc; // Control name
  TextFormField textFormField; // TextFormField widget

  /// Constructor for TFF class.
  /// [textFormField] is the TextFormField widget.
  /// [cnc] is the control name.
  TFF({required this.textFormField, required this.cnc}) {
    textFormField = TextFormField(
      decoration: InputDecoration(
        labelText: '$cnc',
        filled: true,
        fillColor: BODY_TEXT_COLOR,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: BODY_TEXT_COLOR),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: BODY_TEXT_COLOR),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some $cnc';
        }
        return null;
      },
    );
  }
}
