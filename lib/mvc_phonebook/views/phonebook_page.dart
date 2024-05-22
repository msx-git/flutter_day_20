import 'package:flutter/material.dart';
import 'package:flutter_day_20/mvc_phonebook/controllers/contacts_controller.dart';

import 'widgets/add_contact_dialog.dart';
import 'widgets/contact_item.dart';

class PhonebookPage extends StatefulWidget {
  const PhonebookPage({super.key});

  @override
  State<PhonebookPage> createState() => _PhonebookPageState();
}

class _PhonebookPageState extends State<PhonebookPage> {
  final contactsController = ContactsController();

  void delete(int index) {
    contactsController.delete(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVC Contacts'),
      ),
      body: ListView.builder(
        itemCount: contactsController.contacts.length,
        itemBuilder: (context, index) {
          return ContactItem(
            contact: contactsController.contacts[index],
            onDelete: () {
              delete(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic>? data = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AddContactDialog();
            },
          );

          if (data != null) {
            contactsController.add(name: data['name'], phone: data['phone']);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
