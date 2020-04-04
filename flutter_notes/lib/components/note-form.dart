import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNoteForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CreateNoteFormState();

}

class CreateNoteFormState extends State<CreateNoteForm> {

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();
    final _noteController = TextEditingController();

    return Scaffold(
          appBar: AppBar(
            title: Text("Note editor"),
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

                        // TODO: this should emit an event, callback, etc to pass up the new note

                        // _notes.add(_Note(_titleController.text, _noteController.text));
                        // Navigator.pop(context);
                      }
                    },
                    child: Text('Submit'),
                  )
                )
              ],
            ),
          ));
  }

}