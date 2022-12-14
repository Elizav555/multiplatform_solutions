import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final Alignment alignment;

  const MenuWidget({Key? key, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Align(
        alignment: alignment,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Adaptive App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
