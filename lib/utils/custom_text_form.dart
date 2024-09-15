// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final IconData icon;

  const CustomTextForm({
    Key? key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.validator,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
          validator: validator,
          controller: controller,
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              hintText: hintText,
              labelText: label,
              labelStyle: TextStyle(fontSize: 16),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Colors.red)))),
    );
  }
}
