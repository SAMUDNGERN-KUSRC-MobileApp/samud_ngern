import 'package:flutter/material.dart';


showAlert(String title_, String content_, BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title_),
      content: Text(content_),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            Navigator.pop(context)
          },
          child: const Text('ok')
        )
      ]
    )
  );
}
