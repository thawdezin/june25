
import 'package:flutter/material.dart';
import 'package:june30/apple.dart';

import 'orange.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apple.dart';
import 'orange.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppleModel(),
      child: MaterialApp(home: ThawDeZin()),
    ),
  );
}

class ThawDeZin extends StatelessWidget {
  const ThawDeZin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("title")),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Apple()));
              },
              child: Text("Apple"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Orange()));
              },
              child: Text("Orange"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Apple()));
              },
              child: Text("Apple"),
            ),
          ],
        ),
    );
  }
}
