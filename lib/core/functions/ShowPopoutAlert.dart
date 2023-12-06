import 'package:flutter/material.dart';

void showPopupAlert(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the alert
            },
            child: const Center(child: Text('OK')),
          ),
        ],
      );
    },
  );
}
