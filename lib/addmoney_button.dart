import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddmoneyButton extends StatelessWidget {
  void Function() addMoneyFunction;
  AddmoneyButton({super.key, required this.addMoneyFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[700],
              minimumSize: const Size(double.infinity, 0)),
          onPressed: addMoneyFunction,
          child: const Text('Add Money'),
        ),
      ),
    );
  }
}
