import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController t1 = TextEditingController();
  List todos = [];

  addTodo() {
    if (t1.text.length > 0) {
      setState(() {
        todos.add(t1.text);
        t1.clear();
      });
    }
  }

  removeTodo() {
    setState(() {
      todos.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) => ListTile(
                subtitle: Text("Todo Item"),
                title: Text(todos[index]),
              ),
            ),
          ),
          TextField(
            controller: t1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: addTodo,
                child: Text("Add Todo"),
              ),
              RaisedButton(
                onPressed: removeTodo,
                child: Text("Remove Todo"),
              )
            ],
          )
        ],
      ),
    );
  }
}
