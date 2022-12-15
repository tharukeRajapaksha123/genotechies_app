// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:genotechies_app/theme/constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final bool shouldValidate;
  final double padding;
  final InputDecoration? decoration;
  final TextStyle? style;
  final String labelText;
  final Icon? icon;
  const InputField({
    Key? key,
    required this.controller,
    this.isPassword = false,
    this.shouldValidate = true,
    this.padding = defaultPadding,
    this.decoration,
    this.style,
    required this.labelText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: shouldValidate
          ? (val) => val != null
              ? val.isEmpty
                  ? "Please fill this field"
                  : null
              : null
          : null,
      decoration: decoration ??
          InputDecoration(
            fillColor: Colors.grey[100],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: icon,
            labelText: labelText,
            labelStyle: style ??
                const TextStyle(
                  fontSize: mediumFontSize,
                ),
          ),
      style: style ?? const TextStyle(fontSize: mediumFontSize),
    );
  }
}
