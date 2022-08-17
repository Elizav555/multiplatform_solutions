import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_platform.dart';
import '../webview/mock_webview.dart'
    if (dart.library.io) '../webview/non_web_webview.dart'
    if (dart.library.html) '../webview/web_webview.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TextEditingController _inputController = TextEditingController();
  bool _isLoading = false;
  Widget _webView = const Text("Enter Link");
  String operatingSystem = AppPlatform.platform.toString();

  void _getPage(String url) {
    _webView = webView(url);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _inputController,
                        decoration: const InputDecoration(
                          labelText: 'Add Link',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Load'),
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        _getPage(_inputController.value.text);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _webView),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Application running on $operatingSystem',
                          style: const TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
