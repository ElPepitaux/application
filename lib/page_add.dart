// I need to document my code better, but I'm not sure how to do it.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rust_bridge_template/api.dart';
import 'package:flutter_rust_bridge_template/bridge_generated.dart';

// This is the API class that will be used by the Flutter app.
class Option {
  final String title;
  final String value;

  Option({required this.title, required this.value});
}

class InputText extends StatelessWidget {
  const InputText(
      {Key? key,
      required this.label,
      required this.controller,
      required this.maxLength,
      required this.formatnbr})
      : super(key: key);
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
      inputFormatters:
          formatnbr ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class MonthDayPicker extends StatefulWidget {
  final void Function(DateTime? selectedDate)? onDateSelected;

  const MonthDayPicker({Key? key, this.onDateSelected}) : super(key: key);

  @override
  State<MonthDayPicker> createState() => _MonthDayPickerState();
}

class _MonthDayPickerState extends State<MonthDayPicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = null;
  }

  Future<void> _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(pickedDate);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _showDatePicker,
          child: const Text('Sélectionner une date'),
        ),
        if (selectedDate != null)
          Text(
            'Date sélectionnée : ${selectedDate!.day}/${selectedDate!.month}',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
      ],
    );
  }
}

class AddPage extends StatefulWidget {
  const AddPage({Key? key, required this.api}) : super(key: key);
  final Api api;
  @override
  State<AddPage> createState() => _AddPageState();
}

// This is the state of the main page of the app.
class _AddPageState extends State<AddPage> {
  bool showError = false;
  late RustImpl _api;
  final TextEditingController _titreEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();
  final TextEditingController _dateEditingTime = TextEditingController();
  Option? selectedOption;
  DateTime? selectedDate;
  final List<Option> options = [
    Option(title: 'to-do', value: 'to-do'),
    Option(title: 'progress', value: 'progress'),
    Option(title: 'complete', value: 'complete'),
  ];

  @override
  void initState() {
    super.initState();
    _api = widget.api.getapi();
    selectedDate = null;
  }

  void handleDateSelected(DateTime? date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  void dispose() {
    _titreEditingController.dispose();
    _descriptionEditingController.dispose();
    super.dispose();
  }

  String time = "time";
  // This function is called when the user presses the "Save" button.
  bool saveTodo() {
    String day = '${selectedDate!.day} day / ${selectedDate!.month} month';
    if (_titreEditingController.text.isEmpty ||
        _descriptionEditingController.text.isEmpty ||
        _dateEditingTime.text.isEmpty ||
        selectedOption == null || day == '') {
      return false;
    }
    _api.add(
        title: _titreEditingController.text,
        description: _descriptionEditingController.text,
        priority: priority.toString(),
        day: day,
        time: _dateEditingTime.text,
        status: selectedOption!.value);
    Navigator.pop(context);
    return true;
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
            InputText(
                label: "Titre todo",
                controller: _titreEditingController,
                maxLength: 50,
                formatnbr: false),
            InputText(
                label: "Description todo",
                controller: _descriptionEditingController,
                maxLength: 200,
                formatnbr: false),
            MonthDayPicker(onDateSelected: handleDateSelected),
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
            InputText(
                label: "Time todo in hour",
                controller: _dateEditingTime,
                maxLength: 10,
                formatnbr: true),
            ElevatedButton(
              onPressed: () {
                if (!saveTodo()) {
                  setState(() {
                    showError = true;
                  });
                } else {
                  setState(() {
                    showError = false;
                  });
                }
              },
              child: const Text('Save'),
            ),
            if (showError)
              const Text(
                'Please fill all fields',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
