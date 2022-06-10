import 'package:flutter/material.dart';
import 'package:uni/model/entities/event.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatelessWidget {
  final DateTime selectedDay;

  AddEvent({Key key, @required this.selectedDay}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameFieldController = TextEditingController();
  TextEditingController timeFieldController = TextEditingController();

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
                vertical: 15.0,
              ),
              child: TextFormField(
                controller: nameFieldController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Give your new event a name',
                  labelText: 'Name',
                ),
                onSaved: (name) => nameFieldController.text = name.toString(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              child: TextFormField(
                controller: timeFieldController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.access_time),
                  hintText: 'Enter an hour (HH:mm)',
                  labelText: 'Hour',
                ),
                onSaved: (time) {
                  if (timeFieldController.text.isNotEmpty &&
                      timeFieldController.text.length == 5) {
                    timeFieldController.text = time.toString();
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 35.0,
              ),
              child: FloatingActionButton.extended(
                label: Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.check_rounded, color: Colors.white),
                backgroundColor: Colors.grey[900],
                onPressed: () {
                  /*
                  String name = nameFieldController.text;
                  DateTime time = DateTime(2022);
                  if (timeFieldController.text.isNotEmpty) {
                    int y = selectedDay.year;
                    int m = selectedDay.month;
                    int d = selectedDay.day;
                    int h = int.parse(timeFieldController.text.substring(0, 2));
                    int min =
                        int.parse(timeFieldController.text.substring(3, 5));
                    time = DateTime(y, m, d, h, m);
                  }
                  Navigator.pop(context, Event(name, time));
                  */
                  Navigator.pop(
                      context, Event('Lembrete (Estudo)', selectedDay));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
