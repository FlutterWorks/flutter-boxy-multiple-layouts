// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:boxy/boxy.dart';

class ProxyBoxy extends BoxyDelegate {}

void main() {
  // Viewports call buildScope, which can fail if we call layout inside of our
  // own buildScope for inflation.
  testWidgets('CustomScrollView smoketest', (tester) => tester.runAsync(() async {
    await tester.pumpWidget(MaterialApp(
      home: CustomBoxy(
        delegate: ProxyBoxy(),
        children: [
          LayoutId(id: #list, child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  for (int i = 0; i < 10; i++) Text('$i'),
                ]),
              ),
            ],
          )),
        ],
      ),
    ));
  }));
}