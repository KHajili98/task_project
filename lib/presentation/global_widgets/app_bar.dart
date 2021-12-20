import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app.dart';

AppBar customAppBar({BuildContext? context, String? title}) {
  return AppBar(
    title: Text(title!),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context!,
                  MaterialPageRoute(
                    builder: (context) => App(),
                  ),
                  (route) => false);
            },
            icon: Icon(Icons.refresh)),
      )
    ],
  );
}
