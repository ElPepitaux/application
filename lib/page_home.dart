import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge_template/bridge_generated.dart'
    show Todo, RustImpl;
import 'package:flutter_rust_bridge_template/api.dart';

class ColumnTodo extends StatelessWidget {
  const ColumnTodo({Key? key, required this.todosTodo, required this.name})
      : super(key: key);
  final List<Todo> todosTodo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Text(name, style: const TextStyle(color: Colors.white)),
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
                todos.where((todo) => todo.status == "todo").toList();
            List<Todo> todoProgress =
                todos.where((todo) => todo.status == "progress").toList();
            List<Todo> todoComplete =
                todos.where((todo) => todo.status == "complete").toList();
            return Row(
              children: [
                Expanded(
                  child: ColumnTodo(todosTodo: todoTodo, name: "Todo"),
                ),
                Expanded(
                  child: ColumnTodo(todosTodo: todoProgress, name: "Progress"),
                ),
                Expanded(
                  child: ColumnTodo(todosTodo: todoComplete, name: "Complete"),
                ),
              ],
            );
          }),
    );
  }
}
