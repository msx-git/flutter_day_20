import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final formKey = GlobalKey<FormState>();
  String title = "";
  var date = DateTime.now();

  void add() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pop(context, {
        "title": title,
        "date": date,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add todo"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Enter todo title',
              ),
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Enter todo title!";
                }
                return null;
              },
              onSaved: (newValue) {
                title = newValue ?? "";
              },
              onEditingComplete: add,
            ),
            Text(DateFormat('d-MMMM, yyyy').format(date)),
            TextButton(
              onPressed: () async {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  currentDate: DateTime.now(),
                ).then((value) => setState(() => date = value!));
                // setState(() {});
              },
              child: const Text('Change date'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        TextButton(
          onPressed: add,
          child: const Text(
            'Add',
            style: TextStyle(color: Colors.teal),
          ),
        ),
      ],
    );
  }
}
