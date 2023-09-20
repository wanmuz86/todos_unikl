import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  // 2 - Each TextField needs to have a TextEditingController
  var nameEditingController = TextEditingController();
  var placeEditingController = TextEditingController();
  var descEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Page")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text("Please fill in all the information:"),
              TextField(
                decoration: InputDecoration(hintText: "Enter item name"),
                // 3 Link the controller to it's textfield
                controller: nameEditingController,
              ),
              TextField(decoration: InputDecoration(hintText: "Enter item description"),
              controller: descEditingController,),
              TextField(decoration: InputDecoration(hintText: "Enter item place"),
              controller: placeEditingController,),
              ElevatedButton(
                  onPressed: () {
                    // 4 Bring out the value through property text
                    print(nameEditingController.text);
                    print(descEditingController.text);
                    print(placeEditingController.text);
                    // 2) In sender, pass the item as second parameter in navigator.pop

                    var item = {
                      "name":nameEditingController.text,
                      "description":descEditingController.text,
                      "place":placeEditingController.text,
                      "completed":false
                    };
                    Navigator.pop(context, item);
                  },
                  child: Text("Add new Item"))
            ],
          ),
        ),
      ),
    );
  }
}
