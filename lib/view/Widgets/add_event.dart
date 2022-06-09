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

  String title;
  DateTime time;

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
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 4.0,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Enter a name for the new event',
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  title = value;
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 4.0,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.access_time),
                  hintText: 'Enter an hour (HH:mm)',
                  labelText: 'Hour',
                ),
                validator: (value) {
                  if (value.isNotEmpty && value.length == 5) {
                    int y = widget.selectedDay.year;
                    int m = widget.selectedDay.month;
                    int d = widget.selectedDay.day;
                    int h = int.parse(value.substring(0, 2));
                    int min = int.parse(value.substring(3, 5));
                    time = DateTime(y, m, d, h, m);
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final event = Event('tauas', DateTime(2022, 6, 11, 12, 00));
                    Navigator.pop(context, event);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
