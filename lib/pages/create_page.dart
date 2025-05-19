import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final selectedIndex = 0;

  final titlecontroller = TextEditingController();
  final desccontroller = TextEditingController();

  void save() {
    final title = titlecontroller.text.trim();
    final desc = desccontroller.text.trim();

    if (title.isEmpty || desc.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Fill the title and desciption')));
    } else {
      FirebaseFirestore.instance.collection('notes').add({
        'title': title,
        'content': desc,
        'timestamp': Timestamp.now(),
      });
      titlecontroller.clear();
      desccontroller.clear();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Notes Saved successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 20),
            child: Column(
              children: [
                TextField(
                  controller: titlecontroller,

                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: desccontroller,
                  decoration: InputDecoration(
                    label: Text('Description'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  maxLines: 7,
                ),
                SizedBox(height: 15),
                ElevatedButton(onPressed: save, child: Text('Save')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
