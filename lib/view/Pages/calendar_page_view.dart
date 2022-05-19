import 'package:flutter/material.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarPageViewState();
}

class CalendarPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final List<Exam> exams = store.state.content['exams'];
        final Map<String, bool> filteredExams =
            store.state.content['filteredExams'];
        return exams
            .where((exam) =>
                filteredExams[Exam.getExamTypeLong(exam.examType)] ?? true)
            .toList();
      },
      builder: (context, exams) {
        return Cal(exams: exams);
      },
    );
  }
}

class Cal extends StatefulWidget {
  final List<Exam> exams;

  Cal({Key key, @required this.exams}) : super(key: key);

  @override
  State<Cal> createState() => CalPage();
}

class CalPage extends State<Cal> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

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
      body: TableCalendar(
        //locale: 'pt_BR',
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
      ),
    );
  }
}
