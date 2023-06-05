import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter_rust_bridge_template/bridge_generated.dart';


const base = "rust";
final path =
    Platform.isWindows ? "$base.dll" : "rust/target/release/lib$base.so";
final dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(path);

final api = RustImpl(dylib);

class Option {
  final String title;
  final String value;

  Option({required this.title, required this.value});
}

class InputText extends StatelessWidget {
  const InputText({Key? key,
  required this.label,
  required this.controller,
  required this.maxLength,
  required this.formatnbr
  }) : super(key: key);
  final int maxLength;
  final String label;
  final TextEditingController controller;
  final bool formatnbr;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      maxLength: maxLength,
      controller: controller,
      inputFormatters: formatnbr ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _titreEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController = TextEditingController();
  final TextEditingController _dateEditingTime = TextEditingController();
  Option? selectedOption;

  final List<Option> options = [
    Option(title: 'to-do', value: 'to-do'),
    Option(title: 'progress', value: 'progress'),
    Option(title: 'complete', value: 'complete'),
  ];

  @override
  void dispose() {
    _titreEditingController.dispose();
    _descriptionEditingController.dispose();
    super.dispose();
  }
  String time = "time";
  void saveTodo() {
    api.add(
    title: _titreEditingController.text,
    description: _descriptionEditingController.text,
    priority: priority.toString(),
    time: _dateEditingTime.text,
    status: selectedOption!.value
    );
    api.display();
    Navigator.pop(context);
  }
  var item = [
    "haute",
    "moyenne",
    "basse",
    "urgence",
  ];
  String? priority;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 72, 72),
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputText(label: "Titre todo", controller: _titreEditingController, maxLength: 50, formatnbr: false),
            InputText(label: "Description todo", controller: _descriptionEditingController, maxLength: 200, formatnbr: false),
            DropdownButton(
              hint: const Text("Select priority"),
              value: priority,
              icon: const Icon(Icons.arrow_downward),
              items: item.map((items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    priority = newValue!;
                  });
                },
              ),
            Column(
              children: options
                  .map((option) => RadioListTile<Option>(
                        title: Text(option.title),
                        value: option,
                        groupValue: selectedOption,
                        onChanged: (currentOption) {
                          setState(() {
                            selectedOption = currentOption;
                          });
                        },
                      ))
                  .toList(),
            ),
            InputText(label: "Time todo in hour", controller: _dateEditingTime, maxLength: 10, formatnbr: true),
            ElevatedButton(
              onPressed: saveTodo,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
