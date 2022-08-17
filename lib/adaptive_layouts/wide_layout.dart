import 'package:flutter/material.dart';

import '../model/corgi.dart';
import 'list_card.dart';
import 'menu_widget.dart';

class WideLayout extends StatelessWidget {
  const WideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topCenter,
            child: MenuWidget(
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: GridView.count(
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              ...corgis.map((corgi) => ListCard(corgi: corgi)).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
