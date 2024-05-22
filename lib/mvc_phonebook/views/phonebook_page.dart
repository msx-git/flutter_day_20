import 'package:flutter/material.dart';
import 'package:flutter_day_20/mvc_phonebook/controllers/contacts_controller.dart';
import 'package:flutter_day_20/mvc_phonebook/models/contact.dart';

import 'widgets/add_contact_dialog.dart';
import 'widgets/contact_item.dart';
import 'widgets/edit_contact_widget.dart';

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

  void onEdit(int index, Contact contact) {
    contactsController.edit(index, contact);
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
            onEdit: () async {
              var newContact = await showDialog(
                context: context,
                builder: (context) {
                  return EditContactDialog();
                },
              );
              if (newContact != null) {
                onEdit(index, newContact);
                setState(() {});
              }
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
