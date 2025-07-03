import 'package:flutter/material.dart';
import 'package:june30/orange.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            "I am ${appleModel.retrieveOrangeName()} and I have ${appleModel.retrieveOrangeCount} and ${appleModel.retrieveOrangeCount} from prefs",
          ),
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

          FutureBuilder(
            future: Future.wait([
              appleModel.retrieveOrangeName(),
              appleModel.retrieveOrangeCount(),
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final results = snapshot.data as List;
                final name = results[0];
                final count = results[1];

                return Text(
                  "I am $name and I have $count from prefs",
                );
              }
            },
          )



        ],
      ),
    );
  }
}

class AppleModel extends ChangeNotifier {
  String appleName = "Apple Name";
  int appleCount = 0;
  String orangeName = "Orange Name in Apple.dart";
  int orangeCount = 0;

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

  Future<String> retrieveOrangeName() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("orangeName") ?? "NIL from orangeName";
  }

  Future<int> retrieveOrangeCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("orangeCount") ?? 0;
  }

}
