import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Apple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appleModel = Provider.of<AppleModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Apple!")),
      body: Column(
        children: [
          Text(
            "I am ${appleModel.appleName} and I have ${appleModel.appleCount}",
          ),
          ElevatedButton(
            onPressed: () {
              appleModel.incrementAppleCount();
            },
            child: Text("Increase Apple Count"),
          ),
        ],
      ),
    );
  }
}

class AppleModel extends ChangeNotifier {
  String appleName = "Apple Name";
  int appleCount = 0;

  void setAppleName(String name) {
    appleName = name;
    notifyListeners();
  }

  void incrementAppleCount() {
    appleCount += 1;
    notifyListeners();
  }

  void setAppleCount(int count) {
    appleCount = count;
    notifyListeners();
  }
}
