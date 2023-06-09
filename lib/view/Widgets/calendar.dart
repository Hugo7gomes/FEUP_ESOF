import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uni/model/entities/event.dart';
import 'package:uni/view/Widgets/add_event.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  final List<Event> events;

  Calendar({Key key, @required this.events}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CalendarWidget();
  }
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
        backgroundColor: Color.fromARGB(255, 0x75, 0x17, 0x1e),
        automaticallyImplyLeading: false,
      ),
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
                _selectedEvents = ValueNotifier(_getEventsForDay(selectedDay));
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
                  color: Color.fromARGB(255, 0x75, 0x17, 0x1e),
                  shape: BoxShape.circle,
                ),
                todayDecoration: const BoxDecoration(
                  color: Color.fromARGB(255, 190, 40, 40),
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
              label: Text(
                'Adicionar Evento',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.add, color: Colors.white),
              backgroundColor: Colors.grey[900],
              onPressed: () async {
                final event = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddEvent(selectedDay: _selectedDay)),
                );
                if (event.getTitle() != '') {
                  widget.events.add(event);
                  setState(() {
                    _selectedEvents =
                        ValueNotifier(_getEventsForDay(_selectedDay));
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 8.0),
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
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color.fromARGB(255, 190, 40, 40)),
                      child: ListTile(
                        textColor: Colors.white,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              value[index].description,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
