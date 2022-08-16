import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

class MyResponse {
  String body = '';
  String headers = '';
  String cors = '';
  String? error;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _inputController = TextEditingController();
  MyResponse _myResponse = MyResponse();
  bool _isLoading = false;

  void _getPage(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() => {
              _myResponse = MyResponse()
                ..body = response.body
                ..headers = parse(response.body)
                    .getElementsByTagName('title')[0]
                    .text
                    .trim()
                ..cors =
                    response.headers['access-control-allow-origin'] ?? "None",
              _isLoading = false
            });
      }
    } catch (e) {
      setState(() => {
            _myResponse = MyResponse()..error = e.toString(),
            _isLoading = false
          });
    }
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
                  height: 40.0,
                ),
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else if (_myResponse.error != null)
                  Center(child: Text(_myResponse.error ?? ''))
                else
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                    children: [
                      Text(
                        _myResponse.headers,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (_myResponse.cors.isNotEmpty)
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'CORS Headers : ${_myResponse.cors}',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      Text(
                        _myResponse.body,
                      ),
                    ],
                  ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
