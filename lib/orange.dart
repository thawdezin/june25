import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apple.dart';

class Orange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appleModel = Provider.of<AppleModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Orange")),
      body: Column(
        children: [
          Text("Apple Name: ${appleModel.appleName}"),
          Text("Apple Count: ${appleModel.appleCount}"),
          ElevatedButton(
            onPressed: () {
              appleModel.setAppleName("New Apple Name from Orange");
            },
            child: Text("Change Apple Name"),
          ),
          ElevatedButton(
            onPressed: () {
              appleModel.setAppleCount(appleModel.appleCount + 10);
            },
            child: Text("Increase Apple Count by 10"),
          ),
        ],
      ),
    );
  }
}