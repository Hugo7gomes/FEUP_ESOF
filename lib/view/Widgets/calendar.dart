import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uni/model/entities/event.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  final List<Event> events;

  Calendar({Key key, @required this.events}) : super(key: key);

  @override
  State<Calendar> createState() => CalendarWidget();
}

class CalendarWidget extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  ValueNotifier<List<Event>> _selectedEvents = ValueNotifier(<Event>[]);

  List<Event> _getEventsForDay(DateTime day) {
    final e = <Event>[];
    for (var event in widget.events) {
      if (isSameDay(event.date, day)) {
        e.add(event);
      }
    }
    return e;
  }

  final TextEditingController _eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calendário',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[900],
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            TableCalendar(
              locale: 'pt_BR',
              firstDay: DateTime(2000),
              lastDay: DateTime(2070),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents =
                      ValueNotifier(_getEventsForDay(selectedDay));
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              availableCalendarFormats: const {
                CalendarFormat.month: 'Mês',
                CalendarFormat.twoWeeks: '2 Semanas',
                CalendarFormat.week: 'Semana'
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  defaultTextStyle: const TextStyle(color: Colors.black),
                  selectedDecoration: BoxDecoration(
                    color: Colors.red[900],
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  )),
              headerStyle: const HeaderStyle(
                formatButtonShowsNext: false,
              ),
              eventLoader: (day) {
                return _getEventsForDay(day);
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.grey[900],
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Adicionar Evento'),
                    content: TextFormField(
                      controller: _eventController,
                    ),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () => {
                          if (_eventController.text.isNotEmpty)
                            {
                              widget.events.add(Event(
                                _eventController.text,
                                _selectedDay,
                              ))
                            },
                          _eventController.clear(),
                          Navigator.pop(context),
                        },
                      ),
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                label: Text(
                  'Adicionar Evento',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.add, color: Colors.white),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.red[800]),
                        child: ListTile(
                            textColor: Colors.white,
                            title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(value[index].title),
                                  Text(value[index].description),
                                ])),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
