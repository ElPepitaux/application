import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge_template/bridge_generated.dart'
    show Todo, RustImpl;
import 'package:flutter_rust_bridge_template/api.dart';

class ColumnTodo extends StatelessWidget {
  const ColumnTodo({Key? key, required this.todosTodo, required this.name, required this.api})
      : super(key: key);
  final List<Todo> todosTodo;
  final String name;
  final RustImpl api;

  @override
  Widget build(BuildContext context) {
    var color = name == "to-do"
        ? Colors.red
        : name == "progress"
            ? Colors.blue
            : Colors.green;
    return Container(
      width: 200, // Adjust the width as per your requirement
      height: 800, // Adjust the height as per your requirement
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todosTodo.length,
              itemBuilder: (context, index) {
                Todo todo = todosTodo[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 105, 97, 97),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          api.removeTodo(title: todo.title);
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            todo.day,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            todo.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          Container(
                            width:
                                50, // Adjust the width as per your requirement
                            height:
                                20, // Adjust the height as per your requirement
                            decoration: BoxDecoration(
                              color: todo.priority == "haute"
                                  ? Colors.red
                                  : todo.priority == "moyenne"
                                      ? Colors.blue
                                      : todo.priority == "basse"
                                          ? Colors.green
                                          : Colors.black,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                todo.priority,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            todo.status,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${todo.time} hours",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key, required this.api}) : super(key: key);
  final Api api;
  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  late RustImpl _api;
  late Future<List<Todo>> _todosFuture;
  late List<Todo> todosTodo;
  late List<Todo> todosProgress;
  late List<Todo> todosComplete;

  @override
  void initState() {
    super.initState();
    _api = widget.api.getapi();
    _todosFuture = _api.getTodos();
  }

  void loadtodo() {
    setState(() {
      _todosFuture = _api.getTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("refresh"),
        actions: [
          IconButton(
            onPressed: loadtodo,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Todo>>(
          future: _todosFuture,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Text("No todo found",
                  style: TextStyle(color: Colors.white));
            }
            List<Todo> todos = snapshot.data!;
            List<Todo> todoTodo =
                todos.where((todo) => todo.status == "to-do").toList();
            List<Todo> todoProgress =
                todos.where((todo) => todo.status == "progress").toList();
            List<Todo> todoComplete =
                todos.where((todo) => todo.status == "complete").toList();
            return Row(
              children: [
                Expanded(
                  child: ColumnTodo(todosTodo: todoTodo, name: "to-do", api: _api),
                ),
                Expanded(
                  child: ColumnTodo(todosTodo: todoProgress, name: "progress", api: _api),
                ),
                Expanded(
                  child: ColumnTodo(todosTodo: todoComplete, name: "complete", api: _api),
                ),
              ],
            );
          }),
    );
  }
}
