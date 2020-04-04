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

class _NotesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotesListState();
}

class _NotesListState extends State<_NotesList> {
  final _notes = <_Note>[_Note('Note 1', '...'), _Note('Note 2', '...')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Notes'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addNote,
            )
          ],
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
      trailing: Icon(Icons.edit),
      onTap: () {
        // go to edit
      },
      onLongPress: () {
        // bring up delete prompt???
      },
    );
  }

  void _addNote() {

    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();
    final _noteController = TextEditingController();

    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Add a note"),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter a title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _noteController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Enter note',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a note';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _notes.add(_Note(_titleController.text, _noteController.text));
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Submit'),
                  )
                )
              ],
            ),
          ));
    }));
  }

  void _editNote(_Note note) {

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
