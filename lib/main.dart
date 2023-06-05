import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge_template/page_add.dart';
import 'package:flutter_rust_bridge_template/page_home.dart';
import 'package:flutter_rust_bridge_template/api.dart';

// This is the main function of the app.
void main() {
  // This is the api that will be used by the app.
  final api = Api();
  runApp(MyApp(api: api));
}

// This is the main widget of the app.
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

// This is the main page of the app.
class RoutePage extends StatefulWidget {
  final Api api;
  const RoutePage({Key? key, required this.api}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

// This is the state of the main page of the app.
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
