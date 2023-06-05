import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge_template/bridge_generated.dart'
    show Todo, RustImpl;
import 'package:flutter_rust_bridge_template/api.dart';

class ColumnTodo extends StatelessWidget {
  const ColumnTodo({
    Key? key,
    required this.todosTodo,
    required this.name,
    required this.api,
  }) : super(key: key);

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
      width: 200,
      height: 800,
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
                return Draggable<Todo>(
                  data: todo,
                  feedback: Container(width: 500, height: 500),
                  childWhenDragging: Container(),
                  child: buildTodoContainer(todo),

                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTodoContainer(Todo todo) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 105, 97, 97),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  api.removeTodo(title: todo.title);
                },
                icon: const Icon(Icons.delete),
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                todo.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
            width: 50,
            height: 20,
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
                style: const TextStyle(color: Colors.white, fontSize: 10),
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
    );
  }

  Widget buildDragFeedbackContainer(Todo todo) {
    return Opacity(
      opacity: 0.8,
      child: buildTodoContainer(todo),
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

  void handleDragCompleted(Todo todo, String status) {
    _api.updateStatus(title: todo.title, status: status);
    loadtodo();
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
            return const Text(
              "No todo found",
              style: TextStyle(color: Colors.white),
            );
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
                child: DragTarget<Todo>(
                  onWillAccept: (todo) =>
                      true,
                  onAccept: (todo) => handleDragCompleted(todo, "to-do"),
                  builder: (context, candidateData, rejectedData) {
                    return SingleChildScrollView(
                      child: ColumnTodo(
                        todosTodo: todoTodo,
                        name: "to-do",
                        api: _api,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: DragTarget<Todo>(
                  onWillAccept: (todo) =>
                      true,
                  onAccept: (todo) => handleDragCompleted(todo, "progress"),
                  builder: (context, candidateData, rejectedData) {
                    return SingleChildScrollView(
                      child: ColumnTodo(
                        todosTodo: todoProgress,
                        name: "progress",
                        api: _api,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: DragTarget<Todo>(
                  onWillAccept: (todo) => true,
                  onAccept: (todo) => handleDragCompleted(todo, "complete"),
                  builder: (context, candidateData, rejectedData) {
                    return SingleChildScrollView(
                      child: ColumnTodo(
                        todosTodo: todoComplete,
                        name: "complete",
                        api: _api,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
