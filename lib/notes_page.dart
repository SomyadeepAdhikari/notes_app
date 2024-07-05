import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/components/my_drawer.dart';
import 'package:notes_app/components/note_tile.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/model/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController= TextEditingController();
  @override
  void initState() {
    super.initState();
    //on app startup fetch the existing notes
    readNotes();
  }

  //create note
  void createNote(){
    showDialog(
      
      context: context,
      builder: (context)=> AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('New Note',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        titlePadding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
        content: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
          controller: textController,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        actions: [
          MaterialButton(onPressed: (){
            //add to db
            context.read<NoteDatabase>().addNote(textController.text);
            //clear controller
            textController.clear();
            Navigator.of(context).pop();
          },
            child: Text('create',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
          )
        ],
      ));
  }

  //read note
  void readNotes(){
    context.read<NoteDatabase>().fetchNotes();
  }

  //update Note
  void updateNote(Note note){
    //prefill the current note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        backgroundColor : Theme.of(context).colorScheme.primary,
        title: Text('Update Note',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        content: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed:() {
              context.read<NoteDatabase>().updateNote(note.id,textController.text);
              textController.clear();
              Navigator.of(context).pop();
            },
            child: Text('Update',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
            )
        ],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        titlePadding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ));
  }

  //delete Note
  void deleteNote(int id){
    context.read<NoteDatabase>().deleteNode(id);
  }

  @override
  Widget build(BuildContext context) {

    // note database
    final noteDatabase = context.watch<NoteDatabase>();
    
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: createNote, 
        child: Icon(Icons.add,color: Theme.of(context).colorScheme.inversePrimary),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(fontSize: 48,color: Theme.of(context).colorScheme.inversePrimary)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context,index){
                //get individual note
                final note = currentNotes[index];
            
                return NoteTile(
                  text: note.text, 
                  onEditPressed:  () => updateNote(note), 
                  onDeletePressed: () =>deleteNote(note.id)
                );
              }),
          ),
        ],
      ),
    );
  }
}