import 'package:flutter/material.dart';

import '../adaptive_layouts/narrow_layout.dart';
import '../adaptive_layouts/wide_layout.dart';

class AdaptivePage extends StatefulWidget {
  const AdaptivePage({Key? key}) : super(key: key);

  @override
  State<AdaptivePage> createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive UI'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth < 720
            ? const NarrowLayout()
            : const WideLayout();
      }),
    );
  }
}
