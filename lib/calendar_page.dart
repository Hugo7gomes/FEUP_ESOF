import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: TableCalendar(
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
          });
        },
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
        daysOfWeekVisible: true,
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
      ),
    );
  }
}
