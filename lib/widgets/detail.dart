import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // 1) In receiver, create a variable to store the passed item
  Map<String, dynamic> todo;
  int index;

  // 2) In receiver, create the constructor of the page taking the passed item as parameter
DetailPage({required this.todo, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page"),),

      // 4) In receiver, you can now bring out the value
      body: Center(
        child: Column(
          children: [
            Text(todo["name"]!),
            Text(todo["description"]!),
            Text(todo["place"]!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  print("User is going to delete this item at index $index");

                  var item = {
                    "index":index,
                    "operation":1  // 1 is DELETE 2 is MARK AS COMPLETE
                  };
                  Navigator.pop(context,item);

                }, child: Text("Delete")),
                ElevatedButton(onPressed: (){
                  var item = {
                    "index":index,
                    "operation":2 // 1 is DELETE 2 is MARK AS COMPLETE
                  };
                  Navigator.pop(context,item);

                }, child: Text("Mark as complete"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

