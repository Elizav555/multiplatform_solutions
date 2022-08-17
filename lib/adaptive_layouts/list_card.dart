import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/adaptive_layouts/sheet_actions.dart';
import 'package:multiplatform_solutions/model/corgi.dart';
import 'package:popover/popover.dart';

class ListCard extends StatelessWidget {
  final Corgi corgi;

  const ListCard({Key? key, required this.corgi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 5,
      color: Colors.lightBlueAccent,
      child: ListTile(
        title: Column(
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                  radius: 100,
                  foregroundImage: AssetImage(
                    corgi.image,
                  )),
            ),
            Expanded(
              flex: 1,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '${corgi.name} \n',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextSpan(
                      text: corgi.email,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          showPopover(
            context: context,
            transitionDuration: const Duration(milliseconds: 100),
            bodyBuilder: (context) => const PopoverWidget(),
            onPop: () {},
            direction: PopoverDirection.bottom,
            width: 300,
            height: 200,
            arrowHeight: 15,
            arrowWidth: 30,
            arrowDxOffset: 40,
          );
        },
      ),
    );
  }
}

class PopoverWidget extends StatelessWidget {
  const PopoverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: getSheetActions(() => Navigator.of(context).pop()));
  }
}
