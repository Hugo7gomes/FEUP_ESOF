import 'package:flutter/material.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/delivery.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/entities/delivery.dart';
import 'package:uni/model/entities/event.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Widgets/calendar.dart';

class CalendarPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarPageViewState();
}

List<Exam> getExams(store) {
  final List<Exam> exams = store.state.content['exams'];
  final Map<String, bool> filteredExams = store.state.content['filteredExams'];
  final List<Exam> examEvents = exams
      .where(
          (exam) => filteredExams[Exam.getExamTypeLong(exam.examType)] ?? true)
      .toList();

  return examEvents;
}

List<Delivery> getDeliveries(store) {
  final deliveries = <Delivery>[
    Delivery('DA', DateTime(2022, 6, 6, 23, 59), 'Projeto'),
    Delivery('ESOF', DateTime(2022, 6, 10, 10, 45), 'Apresentação'),
    Delivery('LCOM', DateTime(2022, 6, 13, 12, 00), 'Projeto'),
    Delivery('LTW', DateTime(2022, 6, 14, 23, 59), 'Projeto'),
  ];

  return deliveries;
}

List<Event> getPersonalEvents(store) {
  final personalEvents = <Event>[];
  // to do
  return personalEvents;
}

List<Event> getEvents(store) {
  final events = <Event>[];

  final List<Exam> examEvents = getExams(store);
  for (var exam in examEvents) {
    final event = Event('', DateTime(2022));
    event.examEvent(exam);
    events.add(event);
  }

  final List<Delivery> deliveryEvents = getDeliveries(store);
  for (var delivery in deliveryEvents) {
    final event = Event('', DateTime(2022));
    event.deliveryEvent(delivery);
    events.add(event);
  }

  final List<Event> personalEvents = getPersonalEvents(store);
  for (var event in personalEvents) {
    events.add(event);
  }

  return events;
}

class CalendarPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final List<Event> events = getEvents(store);
        return events;
      },
      builder: (context, events) {
        return Calendar(events: events);
      },
    );
  }
}
