import 'package:flutter/material.dart';
import 'package:june30/orange.dart';
import 'package:provider/provider.dart';

class Apple extends StatelessWidget {
  const Apple({super.key});

  @override
  Widget build(BuildContext context) {
    final appleModel = Provider.of<AppleModel>(context);
    final orangeModel = Provider.of<OrangeModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Apple!")),
      body: Column(
        children: [
          Text(
            "I am ${appleModel.appleName} and I have ${appleModel.appleCount}",
          ),
          Text(
            "I am ${orangeModel.orangeName} and I have ${orangeModel.orangeCount}",
          ),
          ElevatedButton(
            onPressed: () {
              appleModel.incrementAppleCount();
            },
            child: Text("Increase Apple Count"),
          ),


          ElevatedButton(
            onPressed: () {
             orangeModel.setNewName("OK lar?");
            },
            child: Text("new name for orange"),
          ),


          ElevatedButton(
            onPressed: () {
             orangeModel.increaseOrange();
            },
            child: Text("Increase Orange Count"),
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
