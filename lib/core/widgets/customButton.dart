import 'package:flutter/material.dart';
// import 'dart:html';

class CustomButton extends StatelessWidget {
  final String text;
  final double size;
  final void Function() onPressed;
  //final double screenWidth;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.size,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: size,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.lightBlue.shade200),
      ),
    );
  }
}
