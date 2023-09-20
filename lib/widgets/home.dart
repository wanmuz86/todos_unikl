import 'package:flutter/material.dart';
import 'package:todos_unikl/widgets/detail.dart';
import 'add.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> _todos = [{
    "name":"Dartpad data type",
    "place":"Level 27 UniKL",
    "description":"Go through: String, Number, Boolean, List Map",
    "completed":false
  },
    {
      "name":"Navigation",
      "place":"Level 27 UniKL",
      "description":"Go through: Simple Navigation, Pass data forward, pass backward data",
      "completed":false
    },
    {
      "name":"Minum pagie",
      "place":"Lunch room",
      "description":"Menu Nasi Lemak dan kopi o dan teh tarik",
      "completed":false
    },
    {
      "name":"Shared Preference",
      "place":"Level 27 UniKL",
      "description":"Cara simpan data locally di dalam phone",
      "completed":false
    }];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page"), actions: [
        IconButton(onPressed: () async {
// 1) In sender, I will WAIT for the data passed from AddPage and store in a variable
          var newItem = await Navigator.push(context,
          MaterialPageRoute(builder: (context)=> AddPage()));

          // 3) Process the received data

          if (newItem != null){
            _todos.add(newItem);
            setState(() {
              _todos;
            });
          }


        }, icon: Icon(Icons.add))
      ],),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          // How many rows are there - 90 % is the length of the list where the data is store

          itemCount: _todos.length,
          // index refer to the row of the list
          // What to show on each row( index)
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: _todos[index]["completed"] ? Icon(Icons.check) : SizedBox(),
                title:Text(_todos[index]["name"]!),
                subtitle: Text(_todos[index]["place"]!),
                trailing: Icon(Icons.chevron_right),
                onTap: () async {

                  // 3) In sender pass the item through constructor
                 var response = await Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>DetailPage(todo: _todos[index],
                      index:index))
                  );

                 if (response != null){
                   if (response["operation"] == 1){
                     // Delete
                     _todos.removeAt(response["index"]);
                     setState(() {
                       _todos;
                     });
                   }
                   else {
                     // Mark as complete
                     _todos[index]["completed"] = true;
                     setState(() {
                       _todos;
                     });
                   }
                 }
                },
              ),
            );
          }
      ),
    );
  }
}
