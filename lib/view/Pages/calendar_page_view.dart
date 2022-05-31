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

class CalendarPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final events = <Event>[];

        final List<Exam> exams = store.state.content['exams'];
        final Map<String, bool> filteredExams =
            store.state.content['filteredExams'];
        final List<Exam> examEvents = exams
            .where((exam) =>
                filteredExams[Exam.getExamTypeLong(exam.examType)] ?? true)
            .toList();
        for (var exam in examEvents) {
          final event = Event('', '2022-05-30');
          event.examEvent(exam);
          events.add(event);
        }

        final deliveries = <Delivery>[
          Delivery('DA', DateTime(2022, 6, 3, 23, 59), 'Project'),
        ];
        for (var delivery in deliveries) {
          final event = Event('', '2022-05-27');
          event.deliveryEvent(delivery);
          events.add(event);
        }

        return events;
      },
      builder: (context, events) {
        return Calendar(events: events);
      },
    );
  }
}
