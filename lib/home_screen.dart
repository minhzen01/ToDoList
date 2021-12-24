import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todos = [];
  List<bool> checkBox = [];
  String input = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Todo List", textAlign: TextAlign.center)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder:
              (BuildContext context) {
                return AlertDialog(
                  title: const Text("Add ToDoList"),
                    content: Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field cannot be left empty';
                          }
                          else {
                            input = value;
                          }
                        }),
                    ),
                  actions: <Widget> [
                  MaterialButton(
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          todos.add(input);
                          checkBox.add(false);
                          input = "";
                          Navigator.of(context).pop();
                        });
                      }
                      }, child: const Text('Add'),
                  ),
                  ],
                );
              });
          },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  todos.removeAt(index);
                  checkBox.removeAt(index);
                });
               },
               key: Key(todos[index]),
               child: Card(
                 color: checkBox[index] ? Colors.lightBlueAccent : Colors.white,
                 child: ListTile(
                   contentPadding: const EdgeInsets.only(left: 20, right: 10),
                   title: checkBox[index] ? Text(todos[index], style: const TextStyle(decoration: TextDecoration.lineThrough), ) : Text(todos[index]),
                   trailing: IconButton(
                     icon: Icon(checkBox[index] == true ? Icons.check_box : Icons.check_box_outline_blank_outlined, color: Colors.black,),
                     onPressed: () {
                       setState(() {
                         checkBox[index] = !checkBox[index];
                       });
                      },
                   ),
                 ),
               ));
          }
      ),
    );
  }
}
