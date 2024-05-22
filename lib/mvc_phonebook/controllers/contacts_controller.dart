import 'dart:math';

import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactsController {
  final List<Contact> _contacts = [
    Contact(name: 'Tom', phone: '+998 99 888 12 36'),
    Contact(name: 'Jerry', phone: '+998 93 404 12 24'),
    Contact(name: 'Spike', phone: '+998 90 202 12 80'),
  ];

  List<Contact> get contacts => [..._contacts];

  void delete(int index) {
    _contacts.removeAt(index);
  }

  void edit(int index, Contact contact) {
    _contacts[index] = contact;
  }

  void add({required String name, required String phone}) {
    int red = Random().nextInt(255);
    int green = Random().nextInt(255);
    int blue = Random().nextInt(255);

    _contacts.add(
      Contact(
        name: name,
        phone: phone,
        color: Color.fromARGB(255, red, green, blue),
      ),
    );
  }
}
