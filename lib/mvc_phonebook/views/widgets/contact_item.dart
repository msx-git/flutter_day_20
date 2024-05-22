import 'package:flutter/material.dart';
import 'package:flutter_day_20/mvc_phonebook/models/contact.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.contact,
    required this.onDelete,
    required this.onEdit,
  });

  final Contact contact;
  final Function() onDelete;
  final Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: contact.color,
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit, color: Colors.cyan),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}
