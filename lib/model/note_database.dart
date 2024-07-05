import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/model/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{

  static late Isar isar;

  // INITIALISE DATABASE
  static Future<void> initialize() async{
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema], 
      directory: dir.path);
  }

  // A list of notes
  final List<Note> currentNotes=[];

  //CREATE - a note and save to db
  Future<void> addNote(String text) async{

    //create a new note object
    final newNote = Note()..text = text;

    //save to db
    await isar.writeTxn(()=> isar.notes.put(newNote));

    fetchNotes();

  }

  //READ - notes from db
  Future<void> fetchNotes() async{
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  //UPDATE - a note in db
  Future<void> updateNote(int id,String newText) async{
    final existingNote = await isar.notes.get(id);
    if(existingNote!=null){
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  //DELETE - a note from db
  Future<void> deleteNode(int id) async{
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}