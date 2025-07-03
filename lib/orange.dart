import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apple.dart';

class Orange extends StatelessWidget {
  const Orange({super.key});

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

class OrangeModel extends ChangeNotifier {
  var orangeName = "Orange";
  var orangeCount = 0;

  OrangeModel(){
    _loadFromPrefs();
  }



  void increaseOrange() {
    orangeCount += 1;
    notifyListeners();
  }

  void decreaseOrange() {
    orangeCount -= 1;
    _saveToPrefs();
    notifyListeners();
  }

  void setNewName(String input) {
    orangeName = input;
    _saveToPrefs();
    notifyListeners();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    orangeCount = prefs.getInt("orangeCount") ?? 0;
    orangeName = prefs.getString("orangeName") ?? "Orange";

  }

  _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("orangeName", orangeName);
    await prefs.setInt("orangeCount",orangeCount);
  }

}
