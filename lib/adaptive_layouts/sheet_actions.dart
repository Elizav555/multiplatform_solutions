import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> getSheetActions(void Function() onPressed) => [
      _getAction(onPressed, Icons.add_a_photo, "Take photo"),
      _getAction(onPressed, Icons.account_balance, "Go to museum"),
      _getAction(onPressed, Icons.accessibility, "Hug"),
    ];

_getAction(void Function() onPressed, IconData icon, String label) =>
    CupertinoActionSheetAction(
      isDefaultAction: true,
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
