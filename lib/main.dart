import 'package:flutter/material.dart';
import 'package:notes_app/model/note_database.dart';
import 'package:notes_app/notes_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized;
  await NoteDatabase.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}