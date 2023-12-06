import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String value;
  final TextEditingController myController;
  const CustomTextFormField({required this.value, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: TextFormField(
        controller: myController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            hintText: value,
            contentPadding: EdgeInsets.only(left: 20)),
      ),
    );
  }
}
