import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge_template/page_add.dart';
import 'package:flutter_rust_bridge_template/page_home.dart';
import 'package:flutter_rust_bridge_template/api.dart';

void main() {
  final api = Api();
  runApp(MyApp(api: api));
}

class MyApp extends StatelessWidget {
  final Api api;
  const MyApp({Key? key, required this.api}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: RoutePage(api: api),
    );
  }
}

class RoutePage extends StatefulWidget {
  final Api api;
  const RoutePage({Key? key, required this.api}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  late Api api;

  @override
  void initState() {
    super.initState();
    api = widget.api;
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apptodo"),
      ),
      body: BodyPage(api: api),
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPage(api: api)));
          },
          child: const Center(
            child: Text('add todo'),
          ),
        ),
      ),
    );
  }
}
