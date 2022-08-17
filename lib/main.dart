import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/pages/adaptive_page.dart';
import 'package:multiplatform_solutions/pages/html_page.dart';
import 'package:multiplatform_solutions/pages/web_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multiplatform',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/searchHTML': (context) => const HTMLPage(),
          '/searchWeb': ((context) => const WebPage()),
          '/adaptiveUI': ((context) => const AdaptivePage()),
        },
        home: Builder(
          builder: (context) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/searchHTML'),
                      child: const Text('First and Second tasks'),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/searchWeb'),
                      child: const Text('Third task'),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/adaptiveUI'),
                      child: const Text('Fourth task'),
                    ),
                  ],
                ),
              )),
        ));
  }
}
