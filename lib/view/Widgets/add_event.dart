import 'package:flutter/material.dart';
import 'package:uni/model/entities/event.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  final DateTime selectedDay;

  AddEvent({Key key, @required this.selectedDay}) : super(key: key);

  @override
  State<AddEvent> createState() => AddEventWidget();
}

class AddEventWidget extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adicionar evento',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 4.0,
              ),
              child: TextFormField(
                controller: textFieldController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Enter a name for the new event',
                  labelText: 'Name',
                ),
                onSaved: (val) => textFieldController.text = val.toString(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 13.0,
              ),
              child: FloatingActionButton.extended(
                label: Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.check_rounded, color: Colors.white),
                backgroundColor: Colors.grey[900],
                onPressed: () {
                  String title = textFieldController.text;
                  Navigator.pop(
                      context, Event(title, DateTime(2022, 6, 11, 12, 00)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
