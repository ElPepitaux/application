import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  @override
  void dispose() {
    _titreEditingController.dispose();
    _descriptionEditingController.dispose();
    super.dispose();
  }

  void saveTodo() {
    final String titre = _titreEditingController.text;
    final String description = _descriptionEditingController.text;
    final String date = _dateEditingTime.text;
    // Do something with the input text
    print('Titre: $titre');
    print('Description: $description');
    print(state);
    print('Date: $date');
  }
  var item = [
    "haute",
    "moyenne",
    "basse"
  ];
  String? state;

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
              value: state,
              icon: const Icon(Icons.arrow_downward),
              items: item.map((items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    state = newValue!;
                  });
                },
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
