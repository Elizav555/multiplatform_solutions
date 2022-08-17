import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/adaptive_layouts/sheet_actions.dart';

import '../model/corgi.dart';
import 'menu_widget.dart';

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
          child: MenuWidget(
            alignment: Alignment.center,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final corgi = corgis[index];
              return Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                elevation: 5,
                color: Colors.lightBlueAccent,
                child: ListTile(
                  title: Text(
                    corgi.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(corgi.email),
                  leading: CircleAvatar(
                      foregroundImage: AssetImage(
                    corgi.image,
                  )),
                  onTap: () async {
                    onTileTap(context);
                  },
                ),
              );
            },
            itemCount: corgis.length,
          ),
        ),
      ],
    );
  }
}

Future onTileTap(BuildContext context) {
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: CupertinoActionSheet(
                actions: getSheetActions(() => Navigator.of(context).pop())));
      });
}
