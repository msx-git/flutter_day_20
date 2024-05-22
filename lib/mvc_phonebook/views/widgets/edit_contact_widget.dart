
import 'package:flutter/material.dart';

import '../../models/contact.dart';

class EditContactDialog extends StatefulWidget {
  EditContactDialog({super.key});

  @override
  State<EditContactDialog> createState() => _EditContactDialogState();
}

class _EditContactDialogState extends State<EditContactDialog> {
  final formKey = GlobalKey<FormState>();

  String name = "";

  String phone = "";

  void edit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pop(
        context,
        Contact(name: name, phone: phone),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit contact"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Enter new name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Enter your name";
                }
                return null;
              },
              onSaved: (newValue) {
                name = newValue ?? "";
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefix: const Icon(Icons.add, size: 20),
                labelText: 'Enter new number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Enter your number";
                } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                  return "Enter only number";
                }
                return null;
              },
              onSaved: (newValue) {
                phone = newValue ?? "";
              },
              onEditingComplete: edit,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          onPressed: edit,
          child: const Text(
            'Edit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
