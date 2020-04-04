import 'package:flutter/cupertino.dart';

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
    // TODO: implement build
    return null;
  }

}