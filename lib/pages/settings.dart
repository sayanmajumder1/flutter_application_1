import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('Alert Description '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'ok'),
                child: const Text('OK'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
