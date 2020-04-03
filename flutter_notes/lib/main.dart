import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _NotesList(),
    );
  }
}

class _NotesList extends StatefulWidget 
{

  @override
  State<StatefulWidget> createState() => _NotesListState();
  
}

class _NotesListState extends State<_NotesList> {

  final _notes = <_Note>[
    _Note('Note 1', '...'),
    _Note('Note 2', '...')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Notes'),
      ),
      body: _buildNoteList()
    );
  }

  Widget _buildNoteList() {
    return ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, i) {
        // if (i.isOdd) {
        //   return Divider();
        // }

        return _buildNoteRow(_notes[i]);
      },
    );
  }

  Widget _buildNoteRow(_Note note) {
    return ListTile(
      title: Text(note.title),
      trailing: Icon(
        Icons.edit
      ),
      onTap: () {
        // go to edit
      },
      onLongPress: () {
        // bring up delete prompt???
      },
    );
  }

}

class _Note {
  String title;
  String body;

  _Note(String title, String body) {
    this.title = title;
    this.body = body;
  }
}